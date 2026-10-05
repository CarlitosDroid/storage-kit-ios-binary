// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "StorageKit",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        .library(
            name: "StorageKit",
            targets: ["StorageKit", "StorageKitDeps"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", .upToNextMinor(from: "4.2.0")),
    ],
    targets: [
        .binaryTarget(
            name: "StorageKit",
            url: "https://github.com/CarlitosDroid/storage-kit-ios-binary/releases/download/v1.0.3/StorageKit.xcframework.zip",
            checksum: "fa72161eb1c2bcd0aed5453f2d24c925eef93135aafc10dbaa906a389d248e06"
        ),
        // A binaryTarget can't declare dependencies, so this target carries KeychainAccess.
        .target(
            name: "StorageKitDeps",
            dependencies: [
                .product(name: "KeychainAccess", package: "KeychainAccess"),
            ]
        ),
    ]
)
