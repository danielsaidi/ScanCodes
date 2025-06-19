//
//  ScanCode.swift
//  ScanCodes
//
//  Created by Daniel Saidi on 2023-11-21.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

#if !os(watchOS)
import SwiftUI

/// This view can be used to display a scan code for a value.
public struct ScanCode: View {

    /// Create a scan code image with a `value` and `type`.
    ///
    /// - Parameters:
    ///   - scanCode: The scan code value to render.
    ///   - type: The scan code type to use.
    ///   - scale: The scale to apply to the image, by default `1`.
    ///   - rotation: The radian rotation to apply to the image, by default `0`.
    init?(
        value: String,
        type: ScanCodeType,
        scale: CGFloat = 1,
        rotation radians: Double = 0
    ) {
        self.value = value
        self.type = type
        self.scale = scale
        self.rotation = radians
    }

    private let value: String
    private let type: ScanCodeType
    private let scale: CGFloat
    private let rotation: Double

    public var body: some View {
        Image(
            scanCode: value,
            type: type,
            scale: scale,
            rotation: rotation
        )
    }
}

#Preview {

    VStack {
        ScanCode(value: "123456789", type: .aztek, scale: 5)
        ScanCode(value: "123456789", type: .barcode, scale: 2)
        ScanCode(value: "123456789", type: .code128, scale: 2, rotation: .pi/4)
        ScanCode(value: "123456789", type: .pdf417, scale: 2)
        ScanCode(value: "123456789", type: .qr, scale: 5)
    }
}
#endif
