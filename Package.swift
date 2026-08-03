// swift-tools-version:6.2.0

import PackageDescription
import Foundation

let package = Package(
    name: "swift-parsing",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15"),
        .tvOS("13.0"),
        .watchOS("6.0")
    ],
    products: [
        .library(
            name: "Parsing",
            targets: ["Parsing_Aggregation"]
        )
    ],
    traits: [
        .trait(
            name: "CasePaths",
            description: "Easily parse and print enums using CasePaths"
        ),
        .trait(
            name: "default",
            description: "The default traits of this package.",
            enabledTraits: ["CasePaths"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-precompiled/swift-case-paths",
            exact: "1.9.1"
        )
    ],
    targets: [
        .target(
            name: "Parsing_Aggregation",
            dependencies: [
                "Parsing",
                .product(
                    name: "CasePaths",
                    package: "swift-case-paths",
                    condition: .when(traits: ["CasePaths"])
                )
            ]
        ),
        .binaryTarget(
            name: "Parsing",
            url: "https://github.com/swift-precompiled/swift-parsing/releases/download/0.15.0/Parsing-ed4e8ab85c8ecb82fc21ddd179c744a467d2c15cf30555f9e471c5b1a6110076.xcframework.zip",
            checksum: "ed4e8ab85c8ecb82fc21ddd179c744a467d2c15cf30555f9e471c5b1a6110076"
        )
    ]
)