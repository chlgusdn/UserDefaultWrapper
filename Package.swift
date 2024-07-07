// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserDefaultWrapper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UserDefaultWrapper",
            targets: ["UserDefaultWrapper"]),
    ],
    targets: [
        .target(
            name: "UserDefaultWrapper"),
        .testTarget(
            name: "UserDefaultWrapperTests",
            dependencies: ["UserDefaultWrapper"]),
    ]
)
