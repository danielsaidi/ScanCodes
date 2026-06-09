# ``ScanCodes``

A Swift library with scan code functionality

## Overview

![Library logotype](Logo.png)

ScanCodes is a Swift library with scan code-related features for SwiftUI, like a ``ScanCode``  and ``CodeScannerView`` that can scan QR and barcodes directly into your app.



## Installation

ScanCodes can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/ScanCodes.git
```



## Supported Platforms

ScanCodes supports iOS 15, iPadOS 15, macOS 12, tvOS 15, and visionOS 1.



## Getting Started

To render a scan code in SwiftUI, just add a ``ScanCode`` view with the string value to convert, and the ``ScanCodeType`` to use:

```swift
struct ContentView: View {

    var body: some View {
        ScanCode(
            value: "123456789", 
            type: .qr, 
            scale: 5,
            rotation: .pi/4
        )
    }
}
```

To add a QR and barcode scanner to your app, that uses the device camera to look for codes to scan, just use a ``CodeScannerView``: 

```swift
struct ContentView: View {

    @State var code: String?

    var body: some View {
        CodeScannerView(
            code: $code,
            viewfinder: {
                CodeScannerViewfinder()   
            }
        )
    }
}
```

The ``CodeScannerView`` and its ``CodeScannerViewfinder`` overlay can be customized to great extent, with view modifiers like the ``SwiftUICore/View/codeScannerViewfinderStyle(_:)``.



## Demo Application

The [project repository][Project] has a demo app that lets you explore the library.



## Repository

For more information, source code, etc., visit the [project repository][Project].



## License

ScanCodes is available under the MIT license.



## Topics

### Essentials

- ``ScanCode``
- ``ScanCodeType``



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Project]: https://github.com/danielsaidi/ScanCodes
