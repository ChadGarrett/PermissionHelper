// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PermissionHelper",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        // Individual permission products
        .library(name: "PermissionHelperCalendar", targets: ["PermissionHelperCalendar"]),
        .library(name: "PermissionHelperCamera", targets: ["PermissionHelperCamera"]),
        .library(name: "PermissionHelperContacts", targets: ["PermissionHelperContacts"]),
        .library(name: "PermissionHelperMicrophone", targets: ["PermissionHelperMicrophone"]),
        .library(name: "PermissionHelperMusic", targets: ["PermissionHelperMusic"]),
        .library(name: "PermissionHelperNotifications", targets: ["PermissionHelperNotifications"]),
        .library(name: "PermissionHelperPhotos", targets: ["PermissionHelperPhotos"]),
        .library(name: "PermissionHelperReminders", targets: ["PermissionHelperReminders"]),
        .library(name: "PermissionHelperSiri", targets: ["PermissionHelperSiri"])
        
//        .library(
//            name: "PermissionHelper",
//            targets: ["PermissionHelper"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PermissionHelper",
            swiftSettings: [
                .define("PERMISSION_HELPER")
            ]),
        
        .testTarget(
            name: "PermissionHelperTests",
            dependencies: ["PermissionHelper"]),
        
        .target(
            name: "PermissionHelperCalendar",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_CALENDAR"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperCamera",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_CAMERA"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperContacts",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_CONTACTS"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperMicrophone",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_MICROPHONE"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperMusic",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_MUSIC"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperNotifications",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_NOTIFICATIONS"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperPhotos",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_PHOTOS"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperReminders",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_REMINDERS"),
                .define("PERMISSION_HELPER")
            ]),
        
        .target(
            name: "PermissionHelperSiri",
            dependencies: [.target(name: "PermissionHelper")],
            swiftSettings: [
                .define("PERMISSION_HELPER_SIRI"),
                .define("PERMISSION_HELPER")
            ]),
    ]
)
