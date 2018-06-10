// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "feel",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url:"https://github.com/OpenKitten/Meow",from:"1.0.0"),
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor","Meow"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"]),
    ]
)

