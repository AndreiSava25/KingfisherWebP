// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KingfisherWebP",
    platforms: [.iOS(.v12), .tvOS(.v12), .watchOS(.v5), .macOS(.v10_14)], 
    products: [
        .library(name: "KingfisherWebP", targets: ["KingfisherWebP"]),
        .library(name: "KingfisherWebP_ObjC", targets: ["KingfisherWebP_ObjC"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.0.0"),
        .package(url: "https://github.com/SDWebImage/libwebp-Xcode", from: "1.1.0")
    ],
    targets: [
        .target(
            name: "KingfisherWebP_ObjC",
            dependencies: ["libwebp"],
            path: "KingfisherWebP_ObjC",
            cSettings: [
                .headerSearchPath("KingfisherWebP_ObjC/include"),
            ]
        ),
        .target(
            name: "KingfisherWebP",
            dependencies: ["Kingfisher", "KingfisherWebP_ObjC"],
            path: "Sources"
        )
    ]
)
