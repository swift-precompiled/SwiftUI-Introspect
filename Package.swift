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
            url: "https://github.com/swift-precompiled/SwiftUI-Introspect/releases/download/1.3.0/SwiftUIIntrospect-3384dafae67172263a4328fe14da6f09b181d73a2674edf355595a5bc300d359.xcframework.zip",
            checksum: "3384dafae67172263a4328fe14da6f09b181d73a2674edf355595a5bc300d359"
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