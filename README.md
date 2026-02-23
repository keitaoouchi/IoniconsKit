# IoniconsKit

[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg?style=flat)](https://swift.org/)
[![Version](https://img.shields.io/cocoapods/v/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![License](https://img.shields.io/cocoapods/l/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![Platform](https://img.shields.io/cocoapods/p/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![SPM compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)

> Ionicons v4 (696 icons) for UIKit and SwiftUI with type-safe Swift enums.

<img src="https://raw.githubusercontent.com/keitaoouchi/IoniconsKit/master/Screenshots/sample.png" width="320px" />

## Usage

### SwiftUI

```swift
import IoniconsKit
import SwiftUI

// Standalone icon view
IoniconView(.iosHome)
IoniconView(.mdSettings, color: .blue, size: 32)

// As a SwiftUI Image
Image.ionicon(with: .iosCamera, color: .systemOrange, size: 24)

// Label modifier
Text("Settings")
    .ioniconLabel(.mdSettings, color: .gray, size: 18)
```

### UIKit

```swift
import IoniconsKit

// As UIFont in a UILabel
someLabel.font = UIFont.ionicon(of: 18)
someLabel.text = String.ionicon(with: .iosHome)

// As UIImage
someImageView.image = UIImage.ionicon(
    with: .mdCamera,
    textColor: .systemOrange,
    size: CGSize(width: 24, height: 24)
)
```

### Icon Names

Ionicons v4 icons use `ios` and `md` prefixes:
- `.iosHome`, `.iosSettings`, `.iosCamera` — iOS-style icons
- `.mdHome`, `.mdSettings`, `.mdCamera` — Material Design-style icons

For the full icon list, see [Ionicons v4](https://ionic.io/ionicons/v4) or browse
[`Ionicons.swift`](IoniconsKit/Classes/Ionicons.swift).

## Requirements

| Target | Version |
|--------|---------|
| iOS    | >= 18.0 |
| macOS  | >= 10.15 |
| Swift  | >= 6.0 |

## Installation

### Swift Package Manager

```swift
// Package.swift
.package(url: "https://github.com/keitaoouchi/IoniconsKit.git", from: "2.0.0")
```

Or add via Xcode: **File → Add Packages…** and enter the repository URL.

### CocoaPods

```ruby
pod 'IoniconsKit', '~> 2.0'
```

## Migration from v1.x

Version 2.0 updates to Ionicons v4, which renames all icons to use `ios` and `md` prefixes:

| v1.x | v2.x |
|------|------|
| `.home` | `.iosHome` / `.mdHome` |
| `.settings` | `.iosSettings` / `.mdSettings` |
| `.socialTwitter` | `.logoTwitter` |

SwiftUI support and Swift Package Manager support are also new in v2.0.

## License

[ionicons.ttf](https://ionic.io/ionicons) is licensed under the
[MIT License](https://github.com/ionic-team/ionicons/blob/main/LICENSE).

IoniconsKit is available under the MIT license. See the LICENSE file for more info.
