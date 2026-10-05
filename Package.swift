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
            url: "https://github.com/CarlitosDroid/storage-kit-ios-binary/releases/download/v1.0.2/StorageKit.xcframework.zip",
            checksum: "f26bfb093d77692b64da59def0488801faceba7ffd0b868dd001e67af62bf4a7"
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
