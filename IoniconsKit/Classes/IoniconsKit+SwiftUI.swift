#if canImport(SwiftUI)
import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

// MARK: - SwiftUI View

/// A SwiftUI view that renders an Ionicons icon using the ionicons font.
///
/// Example usage:
/// ```swift
/// IoniconView(.iosHome)
/// IoniconView(.mdSettings, color: .blue, size: 32)
/// ```
@available(iOS 18.0, macOS 26.0, tvOS 18.0, watchOS 11.0, *)
public struct IoniconView: View {

  private let icon: Ionicons
  private let color: Color
  private let size: CGFloat

  /// Creates an IoniconView.
  ///
  /// - Parameters:
  ///   - icon: The Ionicons icon to display.
  ///   - color: The foreground color. Defaults to `.primary`.
  ///   - size: The font size. Defaults to `20`.
  public init(_ icon: Ionicons, color: Color = .primary, size: CGFloat = 20) {
    self.icon = icon
    self.color = color
    self.size = size
    FontLoader.loadIfNeeded()
  }

  public var body: some View {
    Text(String.ionicon(with: icon))
      .font(.custom("Ionicons", size: size))
      .foregroundColor(color)
      .accessibilityLabel(icon.accessibilityLabel)
  }
}

// MARK: - Image Extension (UIKit only)

#if canImport(UIKit)
@available(iOS 18.0, tvOS 18.0, watchOS 11.0, *)
public extension Image {

  /// Creates a SwiftUI Image from an Ionicons icon.
  ///
  /// - Parameters:
  ///   - icon: The Ionicons icon to render.
  ///   - color: The icon color. Defaults to `.label`.
  ///   - size: The square side length of the generated image. Defaults to `20`.
  static func ionicon(
    with icon: Ionicons,
    color: UIColor = .label,
    size: CGFloat = 20
  ) -> Image {
    let cgSize = CGSize(width: size, height: size)
    let uiImage = UIImage.ionicon(with: icon, textColor: color, size: cgSize)
    return Image(uiImage: uiImage)
  }
}
#endif

// MARK: - View Modifier

@available(iOS 18.0, macOS 26.0, tvOS 18.0, watchOS 11.0, *)
public struct IoniconLabelModifier: ViewModifier {

  private let icon: Ionicons
  private let color: Color
  private let size: CGFloat

  public init(_ icon: Ionicons, color: Color = .primary, size: CGFloat = 20) {
    self.icon = icon
    self.color = color
    self.size = size
  }

  public func body(content: Content) -> some View {
    Label {
      content
    } icon: {
      IoniconView(icon, color: color, size: size)
    }
  }
}

@available(iOS 18.0, macOS 26.0, tvOS 18.0, watchOS 11.0, *)
public extension View {

  /// Wraps the view in a SwiftUI Label with an Ionicons icon.
  ///
  /// - Parameters:
  ///   - icon: The Ionicons icon to display.
  ///   - color: The icon color.
  ///   - size: The icon font size.
  func ioniconLabel(_ icon: Ionicons, color: Color = .primary, size: CGFloat = 20) -> some View {
    modifier(IoniconLabelModifier(icon, color: color, size: size))
  }
}

// MARK: - Accessibility

public extension Ionicons {

  /// A human-readable label derived from the icon's camelCase name.
  var accessibilityLabel: String {
    let raw = String(describing: self)
    var result = ""
    for char in raw {
      if char.isUppercase, !result.isEmpty {
        result += " "
      }
      result += String(char)
    }
    return result
  }
}

#endif
