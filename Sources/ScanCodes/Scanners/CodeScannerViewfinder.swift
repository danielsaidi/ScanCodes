//
//  CodeScannerViewfinder.swift
//  VinylUI
//
//  Created by Daniel Saidi on 2026-06-09.
//

import SwiftUI

/// This view can be used as an overlay to ``CodeScannerView``
/// to show a visual guide over the camera.
///
/// This view can be styled and customized with the modifier
/// ``SwiftUICore/View/CodeScannerViewfinderStyle(_:)``. The
/// style allows you to customize the overlay.
public struct CodeScannerViewfinder: View {

    public init() {}

    @Environment(\.codeScannerViewfinderStyle) var style

    @State private var isPulsing = true

    public var body: some View {
        ZStack {
            Color.black.opacity(style.backgroundOpacity)
                .mask(
                    Rectangle()
                        .overlay(
                            RoundedRectangle(cornerRadius: style.cornerRadius)
                                .aspectRatio(style.aspectRatio, contentMode: .fit)
                                .padding(60)
                                .blendMode(.destinationOut)
                        )
                        .compositingGroup()
                )

            CornerBrackets(cornerRadius: style.cornerRadius, lineWidth: style.lineWidth)
                .stroke(style.color, lineWidth: style.lineWidth)
                .aspectRatio(style.aspectRatio, contentMode: .fit)
                .padding(60)
                .opacity(isPulsing ? style.pulseOpacityMax : style.pulseOpacityMin)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            withAnimation(
                .easeInOut(duration: style.pulseInterval / 2)
                .repeatForever(autoreverses: true)
            ) {
                isPulsing = false
            }
        }
    }
}

/// This style can be used with a ``CodeScannerViewfinder``.
public struct CodeScannerViewfinderStyle {

    public init(
        aspectRatio: Double = 1,
        backgroundOpacity: Double = 0.4,
        color: Color = .white,
        cornerRadius: Double = 20,
        lineWidth: Double = 4,
        pulseInterval: Double = 1.5,
        pulseOpacityMin: Double = 0.5,
        pulseOpacityMax: Double = 1.0
    ) {
        self.aspectRatio = aspectRatio
        self.backgroundOpacity = backgroundOpacity
        self.color = color
        self.cornerRadius = cornerRadius
        self.lineWidth = lineWidth
        self.pulseInterval = pulseInterval
        self.pulseOpacityMin = pulseOpacityMin
        self.pulseOpacityMax = pulseOpacityMax
    }

    public var aspectRatio: Double
    public var backgroundOpacity: Double
    public var color: Color
    public var cornerRadius: Double
    public var lineWidth: Double
    public var pulseInterval: Double
    public var pulseOpacityMin: Double
    public var pulseOpacityMax: Double
}

public extension CodeScannerViewfinderStyle {

    /// The standard ``CodeScannerViewfinderStyle``.
    static var standard: Self {
        CodeScannerViewfinderStyle()
    }
}

public extension EnvironmentValues {

    /// Used to apply a custom ``CodeScannerViewfinderStyle``.
    @Entry var codeScannerViewfinderStyle = CodeScannerViewfinderStyle.standard
}

public extension View {

    /// Applies a custom ``CodeScannerViewfinderStyle``.
    func codeScannerViewfinderStyle(
        _ style: CodeScannerViewfinderStyle
    ) -> some View {
        environment(\.codeScannerViewfinderStyle, style)
    }
}

private struct CornerBrackets: Shape {

    let cornerRadius: CGFloat
    let lineWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let inset = lineWidth / 2
        let r = CGRect(
            x: rect.minX + inset,
            y: rect.minY + inset,
            width: rect.width - lineWidth,
            height: rect.height - lineWidth
        )
        let l = min(r.width, r.height) * 0.2
        let cr = min(cornerRadius, l)

        // Top-left
        path.move(to: CGPoint(x: r.minX, y: r.minY + l))
        path.addLine(to: CGPoint(x: r.minX, y: r.minY + cr))
        path.addQuadCurve(to: CGPoint(x: r.minX + cr, y: r.minY), control: CGPoint(x: r.minX, y: r.minY))
        path.addLine(to: CGPoint(x: r.minX + l, y: r.minY))

        // Top-right
        path.move(to: CGPoint(x: r.maxX - l, y: r.minY))
        path.addLine(to: CGPoint(x: r.maxX - cr, y: r.minY))
        path.addQuadCurve(to: CGPoint(x: r.maxX, y: r.minY + cr), control: CGPoint(x: r.maxX, y: r.minY))
        path.addLine(to: CGPoint(x: r.maxX, y: r.minY + l))

        // Bottom-right
        path.move(to: CGPoint(x: r.maxX, y: r.maxY - l))
        path.addLine(to: CGPoint(x: r.maxX, y: r.maxY - cr))
        path.addQuadCurve(to: CGPoint(x: r.maxX - cr, y: r.maxY), control: CGPoint(x: r.maxX, y: r.maxY))
        path.addLine(to: CGPoint(x: r.maxX - l, y: r.maxY))

        // Bottom-left
        path.move(to: CGPoint(x: r.minX + l, y: r.maxY))
        path.addLine(to: CGPoint(x: r.minX + cr, y: r.maxY))
        path.addQuadCurve(to: CGPoint(x: r.minX, y: r.maxY - cr), control: CGPoint(x: r.minX, y: r.maxY))
        path.addLine(to: CGPoint(x: r.minX, y: r.maxY - l))

        return path
    }
}

#Preview {
    CodeScannerViewfinder()
        .background(Color.gray)
        .codeScannerViewfinderStyle(.init(color: .yellow, lineWidth: 4, pulseInterval: 1.5))
}
