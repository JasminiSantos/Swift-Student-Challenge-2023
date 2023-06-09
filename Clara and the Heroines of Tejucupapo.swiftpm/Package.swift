// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Clara and the Heroines of Tejucupapo",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "Clara and the Heroines of Tejucupapo",
            targets: ["AppModule"],
            bundleIdentifier: "ADA.Clara-and-the-Heroines-of-Tejucupapo",
            teamIdentifier: "J74996J2KY",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.pink),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ],
            appCategory: .adventureGames
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)