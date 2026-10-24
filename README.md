> [!WARNING]
> **This repository is deprecated and no longer maintained.** Google now provides official Swift Package Manager support for MediaPipe Tasks. Please migrate to [google-ai-edge/mediapipe](https://github.com/google-ai-edge/mediapipe).

## Why is this deprecated?

SwiftTasksVision existed so iOS apps could consume MediaPipe Tasks Vision through Swift Package Manager while Google distributed those libraries with CocoaPods. Google now ships MediaPipe Tasks as an official Swift package, including the `MediaPipeTasksVision` product. Maintaining a parallel wrapper no longer adds value, so this repository is frozen.

## Migrating to the official package

The official package requires iOS 15. This package's manifest declared iOS 13, so raise the app deployment target if it is still below iOS 15.

### Xcode

1. With your project open, choose **File > Add Package Dependencies…**.
2. Enter `https://github.com/google-ai-edge/mediapipe` and select the `mediapipe` package. The [setup guide](https://developers.google.com/edge/mediapipe/solutions/setup_ios) gives **Up to Next Major Version** or the `master` branch as example dependency rules. The Swift package manifest is included from tag `v1.1.0` (current release: `v1.1.1`).
3. Add the **MediaPipeTasksVision** library to your application target. `MediaPipeTasksCommon` is included automatically with that product.

### Package.swift

```swift
dependencies: [
    .package(
        url: "https://github.com/google-ai-edge/mediapipe",
        branch: "master"
    ),
],
targets: [
    .target(
        name: "MyAppTarget",
        dependencies: [
            .product(name: "MediaPipeTasksVision", package: "mediapipe"),
        ]
    ),
]
```

Use `branch: "master"` (or a revision, or a local path) when another Swift package depends on MediaPipe. The official manifest passes `.unsafeFlags` to the linker, and Swift Package Manager rejects a version requirement in that case. The snippet above is the one in Google's iOS setup guide.

| This package | Official replacement |
| --- | --- |
| Product `SwiftTasksVision` | Product `MediaPipeTasksVision` |
| `import MediaPipeTasksVision` | `import MediaPipeTasksVision` |

**Docs:** [Setup guide for iOS](https://developers.google.com/edge/mediapipe/solutions/setup_ios) · [Solutions guide](https://developers.google.com/edge/mediapipe/solutions/guide) · [Pose Landmarker](https://developers.google.com/edge/mediapipe/solutions/vision/pose_landmarker/ios) · [Face Detector](https://developers.google.com/edge/mediapipe/solutions/vision/face_detector/ios) · [Face Landmarker](https://developers.google.com/edge/mediapipe/solutions/vision/face_landmarker/ios) · [Hand Landmarker](https://developers.google.com/edge/mediapipe/solutions/vision/hand_landmarker/ios) · [Holistic Landmarker](https://developers.google.com/edge/mediapipe/solutions/vision/holistic_landmarker/ios) · [Gesture Recognizer](https://developers.google.com/edge/mediapipe/solutions/vision/gesture_recognizer/ios) · [Object Detector](https://developers.google.com/edge/mediapipe/solutions/vision/object_detector/ios) · [Image Classifier](https://developers.google.com/edge/mediapipe/solutions/vision/image_classifier/ios) · [Image Segmenter](https://developers.google.com/edge/mediapipe/solutions/vision/image_segmenter/ios) · [Image Embedder](https://developers.google.com/edge/mediapipe/solutions/vision/image_embedder/ios)

## Thank you

Thank you to everyone who built apps with SwiftTasksVision, and to the contributors who reported issues and sent fixes. Your work covered the gap before Google offered an official Swift package.

---

## Legacy documentation

# SwiftTasksVision

**SwiftTasksVision** is a Swift package that facilitates the integration of Google's MediaPipe Vision solutions into your iOS applications. By adding this package as a dependency, you can seamlessly access MediaPipe's powerful vision APIs without the need for CocoaPods.

> **Disclaimer:** This project is an independent endeavor and is **not affiliated with Google**.

## Features

- **Swift Package Integration:** Simplify your project setup by integrating MediaPipe Vision through Swift Package Manager.
- **Example Application:** Includes an adapted version of Google's original example app, showcasing integration via Swift Package Manager instead of CocoaPods.
- **Automatic Package Update:** On a daily basis the package is updated by a GitHub Action (if needed) and tracks the MediaPipe Vision Task Pods versioning.

## Installation

To integrate **MediaPipeTasksVision** into your Xcode project using this package:

1. **Add Package Dependency:**
   - Open your project in Xcode.
   - Navigate to `File` > `Add Packages...`.
   - Enter the repository URL for SwiftTasksVision.
   - Select the desired version and add the package.

2. **Import and Use:**
   - In your Swift files, finally import MediaPipeTasksVision:
     ```swift
     import MediaPipeTasksVision
     ```
   - Utilize MediaPipe's Vision APIs as documented.

## Example Application

The package includes an adjusted example application (originally from Google) demonstrating real-time pose detection using MediaPipe Vision. This serves as a practical reference for integrating and utilizing the APIs in your projects.

## About MediaPipe Vision

[MediaPipe](https://ai.google.dev/edge/mediapipe/solutions/guide) is a cross-platform framework by Google that offers customizable machine learning solutions for live and streaming media. The Vision component provides state-of-the-art models and tools for tasks such as object detection, face detection, and more.

For detailed information and documentation, refer to the [MediaPipe Tasks Guide](https://ai.google.dev/edge/mediapipe/solutions/tasks).

## License

This project is licensed under the MIT License.

---

*Note: MediaPipe is a trademark of Google. This project is not affiliated with or endorsed by Google.*
