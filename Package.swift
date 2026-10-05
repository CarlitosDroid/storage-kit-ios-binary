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
            url: "https://github.com/CarlitosDroid/storage-kit-ios-binary/releases/download/v1.0.1/StorageKit.xcframework.zip",
            checksum: "0cfe9fa74fd6a531a8aa0bdbf3df83566933f9b52fd394b6aff71bcccfe83210"
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
