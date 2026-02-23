// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "IoniconsKit",
    platforms: [
        .iOS(.v18),
        .macOS(.v26)
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
    swiftLanguageModes: [.v6]
)
