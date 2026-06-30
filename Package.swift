// swift-tools-version:5.9
import PackageDescription
import Foundation

let package = Package(
    name: "SwiftTasksVision",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftTasksVision",
            targets: ["SwiftTasksVision"]
        ),
        .executable(
            name: "UpdatePackage",
            targets: ["UpdatePackage"]
        )
    ],
    targets: [
        .target(
            name: "SwiftTasksVision",
            dependencies: ["SwiftTasksVisionCore"]
        ),
        .target(
            name: "SwiftTasksVisionCore",
            dependencies: ["MediaPipeCommonGraphLibraries", "MediaPipeTasksVision"],
            linkerSettings: [
                .unsafeFlags(["-ObjC"]),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("Accelerate"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("UIKit"),
                .linkedFramework("CoreImage"),
                .linkedFramework("ImageIO"),
                .linkedLibrary("c++")
            ]
        ),
        .binaryTarget(
            name: "MediaPipeTasksVision",
            path: "Dependencies/MediaPipeTasksVision.xcframework"
        ),
        .binaryTarget(
            name: "MediaPipeCommonGraphLibraries",
            path: "Dependencies/MediaPipeCommonGraphLibraries.xcframework"
        ),
        .executableTarget(
            name: "UpdatePackage",
            resources: [
                .process("Resources/MediaPipeVision.Info.plist")
            ]
        ),
    ]
)
