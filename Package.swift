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
            targets: ["SwiftUIIntrospect_Aggregation"]
        ),
        .library(
            name: "SwiftUIIntrospect-Static",
            targets: ["SwiftUIIntrospect_Aggregation"]
        ),
        .library(
            name: "SwiftUIIntrospect-Dynamic",
            targets: ["SwiftUIIntrospect_Aggregation"]
        )
    ],
    targets: [
        .target(
            name: "SwiftUIIntrospect_Aggregation",
            dependencies: ["SwiftUIIntrospect"]
        ),
        .binaryTarget(
            name: "SwiftUIIntrospect",
            url: "https://github.com/swift-precompiled/SwiftUI-Introspect/releases/download/26.0.0-precompiled.1/SwiftUIIntrospect-980dc8d75533a1970a755d5414b7d884838e5bd00726c7027d7af31560be312d.xcframework.zip",
            checksum: "980dc8d75533a1970a755d5414b7d884838e5bd00726c7027d7af31560be312d"
        )
    ]
)