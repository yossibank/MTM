// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import AppleProductTypes
import PackageDescription

let package = Package(
    name: "SampleDemo",
    platforms: [
        .iOS("15.0")
    ],
    products: [
        .iOSApplication(
            name: "SampleDemo",
            targets: ["SampleDemo"],
            bundleIdentifier: "yossibank-yahoo.co.jp.SampleDemo",
            teamIdentifier: "6WHPY5MQSB",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .cloud),
            accentColor: .presetColor(.mint),
            supportedDeviceFamilies: [
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait
            ]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/SnapKit/SnapKit.git",
            from: "5.7.1"
        )
    ],
    targets: [
        .executableTarget(
            name: "SampleDemo",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit")
            ],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
