// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "OnboardingKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "OnboardingKit",
            targets: ["OnboardingKit"]
        )
    ],
    targets: [
        .target(
            name: "OnboardingKit",
            resources: [.process("Resources")],
            swiftSettings: [
                .define("LOCALIZATION_PREFERS_STRING_CATALOGS=YES"),
                .define("SWIFT_EMIT_LOC_STRINGS=YES")
            ]
        ),
        .testTarget(
            name: "OnboardingKitTests",
            dependencies: ["OnboardingKit"]
        )
    ]
)
