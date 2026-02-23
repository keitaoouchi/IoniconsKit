# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

IoniconsKit is a Swift library providing type-safe access to the Ionicons v4 icon font (696 icons) for UIKit and SwiftUI. It is distributed via Swift Package Manager and CocoaPods.

## Building and Running

**Build via Xcode:** Open `IoniconsKit.xcodeproj` or the Example workspace at `Example/IoniconsKit.xcworkspace`.

**Run the Example app:** Use `Example/IoniconsKit.xcworkspace` (requires CocoaPods install first):
```bash
cd Example && pod install
open IoniconsKit.xcworkspace
```

**Build via SPM:**
```bash
swift build
```

**Test via SPM:**
```bash
swift test
```

## Code Architecture

The library has three source files in `IoniconsKit/Classes/`:

- **`Ionicons.swift`** — Generated `public enum Ionicons: String` mapping each icon name (camelCase, e.g. `.iosHome`, `.mdSettings`) to its Unicode codepoint. **Do not edit by hand.**
- **`IoniconsKit.swift`** — UIKit extensions: `UIFont.ionicon(of:)`, `String.ionicon(with:)`, `UIImage.ionicon(with:textColor:size:)`, and `FontLoader` (loads `ionicons.ttf` from the correct bundle for both SPM and CocoaPods).
- **`IoniconsKit+SwiftUI.swift`** — SwiftUI support: `IoniconView` (standalone view), `Image.ionicon(with:color:size:)`, `IoniconLabelModifier` / `.ioniconLabel()` modifier, and `Ionicons.accessibilityLabel`.

The font file lives at `IoniconsKit/Assets/ionicons.ttf`. Bundle resolution handles both SPM (`Bundle.module`) and CocoaPods (resource bundle named `IoniconsKit`).

## Regenerating Icons

`Ionicons.swift` and `Example/IoniconsKit/Ionicons.swift` are generated from `IoniconsKit/Assets/ionicons.txt` using `IoniconsKit/Assets/generator.rb`. To regenerate after updating `ionicons.txt`:

```bash
cd IoniconsKit/Assets
ruby generator.rb
```

This overwrites both generated files. The Example project requires Ruby (managed via `mise` — see `Example/mise.toml`).

## Distribution

- **SPM:** `Package.swift` at repo root, source path `IoniconsKit/Classes`, resource `.copy("Assets/ionicons.ttf")`
- **CocoaPods:** `IoniconsKit.podspec` at repo root; current version `2.0.0`
