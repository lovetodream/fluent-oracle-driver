// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "fluent-oracle-driver",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        .library(
            name: "FluentOracleDriver",
            targets: ["FluentOracleDriver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/fluent-kit.git", from: "1.27.0"),
        .package(url: "https://github.com/lovetodream/oracle-kit.git", branch: "main"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "FluentOracleDriver", dependencies: [
                .product(name: "FluentKit", package: "fluent-kit"),
                .product(name: "FluentSQL", package: "fluent-kit"),
                .product(name: "Logging", package: "swift-log"),
                .product(name: "OracleKit", package: "oracle-kit"),
        ]),
        .testTarget(name: "FluentOracleDriverTests", dependencies: [
                .product(name: "FluentBenchmark", package: "fluent-kit"),
                .target(name: "FluentOracleDriver"),
        ]),
    ]
)
