# IoniconsKit

[![CI Status](http://img.shields.io/travis/keitaoouchi/IoniconsKit.svg?style=flat)](https://travis-ci.org/keita.oouchi/IoniconsKit)
[![Version](https://img.shields.io/cocoapods/v/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![License](https://img.shields.io/cocoapods/l/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)
[![Platform](https://img.shields.io/cocoapods/p/IoniconsKit.svg?style=flat)](http://cocoapods.org/pods/IoniconsKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Ionicons as UILabel

```swift
someLabel.font = UIFont.ionicon(of: 18)
someLabel.text = String.iconicon(with: .socialTwitter)
```

### Ionicons as UIImage

```swift
someImageView.image = UIImage.ionicon(with: .socialFacebook, textColor: UIColor.orange, size: CGSize(width: 18, height: 18))
```

For another icons, plaease see the [source](https://github.com/keitaoouchi/IoniconsKit/blob/master/IoniconsKit/Classes/Ionicons.swift),
or build Example App.

## Requirements

iOS 8 or later.
Swift3.0 or later.

## Installation

IoniconsKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "IoniconsKit"
```

## Author

keita.oouchi, keita.oouchi@gmail.com

## License

[ionicons.ttf](http://ionicons.com/) file is licensed under [MIT license](https://github.com/driftyco/ionicons/blob/master/LICENSE).

IoniconsKit is available under the MIT license. See the LICENSE file for more info.
