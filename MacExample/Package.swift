// swift-tools-version:6.2
import PackageDescription

let package = Package(
    name: "MacExample",
    platforms: [
        .macOS(.v26)
    ],
    dependencies: [
        .package(path: "..")
    ],
    targets: [
        .executableTarget(
            name: "MacExample",
            dependencies: [
                .product(name: "IoniconsKit", package: "IoniconsKit")
            ],
            path: "Sources"
        )
    ],
    swiftLanguageModes: [.v6]
)
