# ``ScanCodes``

A Swift library with scan code functionality

## Overview

![Library logotype](Logo.png)

ScanCodes is a Swift library with scan code features, such as a ``ScanCode`` SwiftUI view that can render string values as scan codes.

ScanCodes extends ``SwiftUICore/Image`` as well as platform-specific image types with scan code-related functionality, and has a ``ScanCodeType`` enum that defines all supported scan code types.



## Installation

ScanCodes can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/ScanCodes.git
```



## Supported Platforms

ScanCodes supports iOS 15, iPadOS 15, macOS 12, tvOS 15, and visionOS 1.



## Support My Work

You can [become a sponsor][Sponsors] to help me dedicate more time on my various [open-source tools][OpenSource]. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed.



## Getting Started

To render a scan code in SwiftUI, just add a ``ScanCode`` with the value and type to render:

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

You can use the same init arguments to create a SwiftUI ``SwiftUICore/Image`` and platform-specific image values.



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
