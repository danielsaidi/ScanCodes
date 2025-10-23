<p align="center">
    <img src="Resources/Icon-Badge.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/ScanCodes?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/badge/swift-6.1-orange.svg" alt="Swift 6.1" />
    <a href="https://danielsaidi.github.io/ScanCodes"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <a href="https://github.com/danielsaidi/ScanCodes/blob/master/LICENSE"><img src="https://img.shields.io/github/license/danielsaidi/ScanCodes" alt="MIT License" /></a>
    <a href="https://github.com/sponsors/danielsaidi"><img src="https://img.shields.io/badge/sponsor-GitHub-red.svg" alt="Sponsor my work" /></a>
</p>


# ScanCodes

ScanCodes is a Swift library with scan code features, such as a ``ScanCode`` SwiftUI view that can render any string value as a scan code.

<p align="center">
    <img src="https://github.com/danielsaidi/ScanCodes/releases/download/0.1.0/ScanCodes-Demo-Picker.gif" alt="Demo Gif" width="300" />
</p>

ScanCodes extends ``Image`` as well as platform-specific image types with scan code-related functionality, and has a ``ScanCodeType`` enum that defines all supported scan code types.



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



## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc.



## Demo Application

The `Demo` folder has a demo app that lets you explore the library.



## Contact

Feel free to reach out if you have questions, or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* E-mail: [daniel.saidi@gmail.com][Email]
* Bluesky: [@danielsaidi@bsky.social][Bluesky]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]



## License

ScanCodes is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Mastodon]: https://mastodon.social/@danielsaidi
[Twitter]: https://twitter.com/danielsaidi

[Documentation]: https://danielsaidi.github.io/ScanCodes
[Getting-Started]: https://danielsaidi.github.io/ScanCodes/documentation/scancodes/getting-started
[License]: https://github.com/danielsaidi/ScanCodes/blob/master/LICENSE
