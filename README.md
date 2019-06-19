# IoniconsKit

[![CI Status](http://img.shields.io/travis/keitaoouchi/IoniconsKit.svg?style=flat)](https://travis-ci.org/keitaoouchi/IoniconsKit)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![License](https://img.shields.io/cocoapods/l/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![Platform](https://img.shields.io/cocoapods/p/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)

<img src="https://raw.githubusercontent.com/keitaoouchi/IoniconsKit/master/Screenshots/sample.png" width="320px" />

> IoniconsKit internally use ionicons.ttf v2.0.1

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Ionicons as UILabel

```swift
someLabel.font = UIFont.ionicon(of: 18)
someLabel.text = String.ionicon(with: .socialTwitter)
```

### Ionicons as UIImage

```swift
someImageView.image = UIImage.ionicon(with: .socialFacebook, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
```

For another icons, plaease see the [source](https://github.com/keitaoouchi/IoniconsKit/blob/master/IoniconsKit/Classes/Ionicons.swift),
or build Example App.



## Requirements

| Target            | Version |
|-------------------|---------|
| iOS               |  => 10.0 |
| Swift             |  => 5.0 |

## Installation

IoniconsKit is available through [CocoaPods](http://cocoapods.org) or [Carthage](https://github.com/Carthage/Carthage).

### CocoaPods

```ruby
pod "IoniconsKit"
```

### Carthage

```
github "keitaoouchi/IoniconsKit"
```

for detail, please follow the [Carthage Instruction](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)

## Author

keita.oouchi, keita.oouchi@gmail.com

## License

[ionicons.ttf](http://ionicons.com/) file is licensed under [MIT license](https://github.com/driftyco/ionicons/blob/master/LICENSE).

IoniconsKit is available under the MIT license. See the LICENSE file for more info.
