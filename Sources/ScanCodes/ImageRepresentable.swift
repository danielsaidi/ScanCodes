//
//  ImageRepresentable.swift
//  ScanCodes
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

#if canImport(UIKit)
import class UIKit.UIImage

typealias ImageRepresentable = UIImage
#elseif canImport(AppKit)
import class AppKit.NSImage

typealias ImageRepresentable = NSImage
#endif

extension Image {
    
    /// Create an image from a certain ``ImageRepresentable``.
    init(image: ImageRepresentable) {
        #if canImport(UIKit)
        self.init(uiImage: image)
        #elseif canImport(AppKit)
        self.init(nsImage: image)
        #endif
    }
}
