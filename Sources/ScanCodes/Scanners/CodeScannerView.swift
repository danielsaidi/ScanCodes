//
//  CodeScannerView.swift
//  VinylUI
//
//  Created by Daniel Saidi on 2026-06-06.
//

@preconcurrency import AVFoundation

import SwiftUI

/// This view can be used to open the device camera, to look
/// for codes to scan.
///
/// The `barcode` string binding is set when a code is found.
/// The view will then stop looking for codes until the code
/// is set to `nil`, e.g. when the app has retained it.
///
/// The ``CodeScannerViewfinder`` overlay can be styled with
/// ``SwiftUICore/View/CodeScannerViewfinderStyle(_:)``. The
/// style only applies when you use this standard viewfinder.
public struct CodeScannerView<Viewfinder: View>: View {

    /// Create a code scanner view.
    ///
    /// - Parameters:
    ///   - barcode: The binding to write scanned codes to.
    ///   - viewfinder: The viewfinder view to use as overlay.
    public init(
        barcode: Binding<String?>,
        viewfinder: @escaping () -> Viewfinder
    ) {
        self._barcode = barcode
        self.viewfinder = viewfinder
    }

    /// Create a code scanner view with a standard viewfinder.
    ///
    /// - Parameters:
    ///   - barcode: The binding to write scanned codes to.
    public init(
        barcode: Binding<String?>
    ) where Viewfinder == CodeScannerViewfinder {
        self._barcode = barcode
        self.viewfinder = { CodeScannerViewfinder() }
    }

    @Binding var barcode: String?

    let viewfinder: () -> Viewfinder

    public var body: some View {
        CodeScannerInternal(barcode: $barcode)
            .overlay { viewfinder() }
    }
}

fileprivate struct CodeScannerInternal: UIViewRepresentable {

    @Binding var barcode: String?

    final class VideoPreview: UIView {

        var previewLayer: AVCaptureVideoPreviewLayer?

        override func layoutSubviews() {
            super.layoutSubviews()
            previewLayer?.frame = bounds
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(barcode: $barcode)
    }

    func makeUIView(context: Context) -> VideoPreview {
        let view = VideoPreview()
        let session = AVCaptureSession()
        context.coordinator.session = session

        guard
            let device = AVCaptureDevice.default(for: .video),
            let input = try? AVCaptureDeviceInput(device: device),
            session.canAddInput(input)
        else { return view }

        session.addInput(input)

        let output = AVCaptureMetadataOutput()
        guard session.canAddOutput(output) else { return view }
        session.addOutput(output)
        output.setMetadataObjectsDelegate(context.coordinator, queue: .main)
        output.metadataObjectTypes = [.ean8, .ean13, .qr, .upce]

        let preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = .resizeAspectFill
        view.previewLayer = preview
        view.layer.addSublayer(preview)
        context.coordinator.previewLayer = preview

        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }

        return view
    }

    func updateUIView(_ uiView: VideoPreview, context: Context) {
        context.coordinator.barcode = $barcode
    }
}

extension CodeScannerInternal {

    final class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {

        var barcode: Binding<String?>
        var session: AVCaptureSession?
        var previewLayer: AVCaptureVideoPreviewLayer?

        init(barcode: Binding<String?>) {
            self.barcode = barcode
        }

        func metadataOutput(
            _ output: AVCaptureMetadataOutput,
            didOutput metadataObjects: [AVMetadataObject],
            from connection: AVCaptureConnection
        ) {
            guard
                barcode.wrappedValue == nil,
                let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
                let value = object.stringValue
            else { return }
            barcode.wrappedValue = value
        }
    }
}
