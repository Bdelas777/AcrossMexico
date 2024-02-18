// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "AcrossMexico",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "AcrossMexico",
            targets: ["AppModule"],
            bundleIdentifier: "bdelas.AcrossMexico.pruebas",
            teamIdentifier: "23D44T2LM8",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .palette),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .landscapeRight,
                .landscapeLeft
            ],
            capabilities: [
                .camera(purposeString: "Access to the camera is needed")
            ]
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