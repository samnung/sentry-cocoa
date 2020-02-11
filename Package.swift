// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "Sentry",
    platforms: [
        .macOS(.v10_10),
        .iOS(.v8),
        .tvOS(.v9),
        .watchOS(.v2),
    ],
    products: [
        .library(
            name: "Sentry",
            targets: ["Sentry"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Sentry",
            dependencies: [
                "SentryCrash",
            ],
            path: "Sources/Sentry",
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
                .linkedFramework("AppKit", .when(platforms: [.macOS])),
            ]
        ),

        .target(
            name: "SentryCrash",
            path: "Sources/SentryCrash",
            publicHeadersPath: "./**",
            cxxSettings: [
                .headerSearchPath("./**"),
            ]
        ),

        .testTarget(
            name: "SentrySwiftTests",
            dependencies: [
                "Sentry",
            ],
            path: "Tests/SentryTests",
            sources: [
                "SentrySwiftTests.swift",
            ]
        ),

        // TODO: make Objective-C tests work.
        // .testTarget(
        //     name: "SentryTests",
        //     dependencies: [
        //         "Sentry",
        //     ],
        //     exclude: [
        //         "SentrySwiftTests.swift",
        //     ]
        // ),
    ]
)
