import UIKit
import CoreText

// MARK: - Public

/// A Ionicons extension to UIFont.
public extension UIFont {

  /// Get a UIFont object of Ionicons.
  ///
  /// - parameter size: The preferred font size.
  /// - returns: A UIFont object of Ionicons.
  public class func ionicon(of size: CGFloat) -> UIFont {
    let name = "ionicons"
    if UIFont.fontNames(forFamilyName: name).isEmpty {
      FontLoader.load(name)
    }

    return UIFont(name: name, size: size)!
  }
}

/// A Ionicons extension to String.
public extension String {

  /// Get a Ionicons icon string with the given icon name.
  ///
  /// - parameter name: The preferred icon name.
  /// - returns: A string that will appear as icon with Ionicons.
  public static func ionicon(with name: Ionicons) -> String {
    let substr = name.rawValue[..<name.rawValue.index(name.rawValue.startIndex, offsetBy: 1)]
    return String(substr)

  }

}

/// A Ionicons extension to UIImage.
public extension UIImage {

  /// Get a Ionicons image with the given icon name, text color, size and an optional background color.
  ///
  /// - parameter name: The preferred icon name.
  /// - parameter textColor: The text color.
  /// - parameter size: The image size.
  /// - parameter backgroundColor: The background color (optional).
  /// - returns: A string that will appear as icon with Ionicons
  public static func ionicon(with name: Ionicons,
                             textColor: UIColor,
                             size: CGSize,
                             backgroundColor: UIColor = UIColor.clear) -> UIImage {

    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = NSTextAlignment.center
    let fontSize = min(size.width, size.height)
    let attributedString = NSAttributedString(
      string: String.ionicon(with: name),
      attributes: [
        NSAttributedStringKey.font: UIFont.ionicon(of: fontSize),
        NSAttributedStringKey.foregroundColor: textColor,
        NSAttributedStringKey.backgroundColor: backgroundColor,
        NSAttributedStringKey.paragraphStyle: paragraph
      ]
    )

    UIGraphicsBeginImageContextWithOptions(size, false , 0.0)
    attributedString.draw(in:
      CGRect(
        x: 0,
        y: (size.height - fontSize) / 2,
        width: size.width,
        height: fontSize
      )
    )
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return image!
  }

}

// MARK: - Private

private class FontLoader {

  class func load(_ name: String) {
    let bundle = Bundle(for: FontLoader.self)
    let fontURL: URL? =
      bundle.url(forResource: name, withExtension: "ttf") ??
      bundle.url(forResource: name, withExtension: "ttf", subdirectory: "IoniconsKit.bundle")

    let data = try! Data(contentsOf: fontURL!)

    let provider = CGDataProvider(data: data as CFData)!
    let font = CGFont(provider)!

    var error: Unmanaged<CFError>?
    if !CTFontManagerRegisterGraphicsFont(font, &error) {
      let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
      let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
      NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
    }
  }

}
