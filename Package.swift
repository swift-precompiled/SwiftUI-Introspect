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
            url: "https://github.com/swift-precompiled/SwiftUI-Introspect/releases/download/1.3.0/SwiftUIIntrospect-8b1ecb50f4d87c8fec981cec5c61bcc4e71dcb47911754caed3f742857f01bf8.xcframework.zip",
            checksum: "8b1ecb50f4d87c8fec981cec5c61bcc4e71dcb47911754caed3f742857f01bf8"
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