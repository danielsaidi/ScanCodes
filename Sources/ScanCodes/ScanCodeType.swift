//
//  ScanCodeType.swift
//  ScanCodes
//
//  Created by Daniel Saidi on 2023-11-21.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import Foundation

/// This enum defines supported scan code types.
public enum ScanCodeType: String, CaseIterable, Identifiable {
    
    /// An `Aztek` scan code.
    case aztek
    
    /// A `Code-128` barcode.
    case code128
    
    /// A `PDF-417` scan code.
    case pdf417
    
    /// A standard `QR` code.
    case qr
}

public extension ScanCodeType {
    
    /// This type is an alias for ``ScanCodeType/code128``.
    static var barcode: ScanCodeType { .code128 }
}

public extension ScanCodeType {
    
    /// The display name of the code type.
    var id: String { rawValue }
    
    /// The display name of the code type.
    var name: String { rawValue.capitalized }
    
    /// The filter name to use when generating a scan code.
    var ciFilterName: String {
        switch self {
        case .aztek: "CIAztecCodeGenerator"
        case .code128: "CICode128BarcodeGenerator"
        case .pdf417: "CIPDF417BarcodeGenerator"
        case .qr: "CIQRCodeGenerator"
        }
    }
}
