// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "IoniconsKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "IoniconsKit",
            targets: ["IoniconsKit"]
        )
    ],
    targets: [
        .target(
            name: "IoniconsKit",
            path: "IoniconsKit",
            sources: ["Classes"],
            resources: [
                .copy("Assets/ionicons.ttf")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
