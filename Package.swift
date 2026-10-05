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
            url: "https://github.com/CarlitosDroid/storage-kit-ios/releases/download/v1.0.0/StorageKit.xcframework.zip",
            checksum: "715c2758df83aa0bb0c5defeb7feef4893ccb07cec37600731e07df62a45e028"
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
