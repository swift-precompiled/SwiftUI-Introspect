// swift-tools-version:6.0.0

import PackageDescription
import Foundation

let package = Package(
    name: "swiftui-introspect",
    platforms: [
        .iOS("13.0"),
        .tvOS("13.0"),
        .macOS("10.15")
    ],
    products: [
        .library(
            name: "SwiftUIIntrospect",
            targets: ["SwiftUIIntrospect_PrecompiledProduct"]
        ),
        .library(
            name: "SwiftUIIntrospect-Static",
            targets: ["SwiftUIIntrospect-Static"]
        ),
        .library(
            name: "SwiftUIIntrospect-Dynamic",
            targets: ["SwiftUIIntrospect-Dynamic"]
        )
    ],
    targets: [
        .target(
            name: "SwiftUIIntrospect_Aggregation",
            dependencies: ["SwiftUIIntrospect"],
            swiftSettings: [.define("SCIPIO_PRECOMPILED_BINARY_WRAPPER")]
        ),
        .binaryTarget(
            name: "SwiftUIIntrospect",
            url: "https://github.com/swift-precompiled/SwiftUI-Introspect/releases/download/1.3.0/SwiftUIIntrospect-aeb4c7a62ec5e2f95922d1365a4a25e746bac057c63f2c3df0dd177ab08e78c8.xcframework.zip",
            checksum: "aeb4c7a62ec5e2f95922d1365a4a25e746bac057c63f2c3df0dd177ab08e78c8"
        ),
        .target(
            name: "SwiftUIIntrospect_PrecompiledProduct",
            dependencies: ["SwiftUIIntrospect_Aggregation"]
        ),
        .target(
            name: "SwiftUIIntrospect-Static",
            dependencies: ["SwiftUIIntrospect_Aggregation"]
        ),
        .target(
            name: "SwiftUIIntrospect-Dynamic",
            dependencies: ["SwiftUIIntrospect_Aggregation"]
        )
    ]
)