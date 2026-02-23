#if canImport(UIKit)
import UIKit
import CoreText

// MARK: - Public

/// A Ionicons extension to UIFont.
public extension UIFont {

  /// Get a UIFont object of Ionicons.
  ///
  /// - parameter size: The preferred font size.
  /// - returns: A UIFont object of Ionicons.
  class func ionicon(of size: CGFloat) -> UIFont {
    let name = "Ionicons"
    if UIFont.fontNames(forFamilyName: name).isEmpty {
      FontLoader.loadIfNeeded()
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
  static func ionicon(with name: Ionicons) -> String {
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
  /// - returns: A UIImage rendered with the specified Ionicons icon.
  static func ionicon(
    with name: Ionicons,
    textColor: UIColor,
    size: CGSize,
    backgroundColor: UIColor = .clear
  ) -> UIImage {
    let paragraph = NSMutableParagraphStyle()
    paragraph.alignment = .center
    let fontSize = min(size.width, size.height)
    let attributedString = NSAttributedString(
      string: String.ionicon(with: name),
      attributes: [
        .font: UIFont.ionicon(of: fontSize),
        .foregroundColor: textColor,
        .backgroundColor: backgroundColor,
        .paragraphStyle: paragraph
      ]
    )

    let renderer = UIGraphicsImageRenderer(size: size)
    return renderer.image { _ in
      attributedString.draw(in: CGRect(
        x: 0,
        y: (size.height - fontSize) / 2,
        width: size.width,
        height: fontSize
      ))
    }
  }

}

// MARK: - Private

internal enum FontLoader {

  static func loadIfNeeded() {
    let fontName = "Ionicons"
    guard UIFont.fontNames(forFamilyName: fontName).isEmpty else { return }
    load(resourceName: "ionicons")
  }

  private static func load(resourceName name: String) {
    let bundle = fontBundle()
    guard let fontURL = bundle.url(forResource: name, withExtension: "ttf") else {
      assertionFailure("IoniconsKit: Could not find ionicons.ttf in bundle \(bundle)")
      return
    }

    guard let data = try? Data(contentsOf: fontURL),
          let provider = CGDataProvider(data: data as CFData),
          let _ = CGFont(provider) else {
      assertionFailure("IoniconsKit: Failed to load font data from \(fontURL)")
      return
    }

    // Register the font by URL for modern platforms
    let success = CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, nil)
    if !success {
      // If registration fails, it's often because it's already registered; ignore
      // but you could log here if needed.
    }
  }

  private static func fontBundle() -> Bundle {
#if SWIFT_PACKAGE
    return Bundle.module
#else
    let classBundle = Bundle(for: _IoniconsKitMarker.self)
    // CocoaPods resource bundle
    if let url = classBundle.url(forResource: "IoniconsKit", withExtension: "bundle"),
       let resourceBundle = Bundle(url: url) {
      return resourceBundle
    }
    return classBundle
#endif
  }
}

// Used as an anchor for Bundle(for:) in CocoaPods builds
private final class _IoniconsKitMarker {}

#endif

