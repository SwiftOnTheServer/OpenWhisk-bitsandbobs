import PackageDescription

let package = Package(
    name: "Action",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura-net.git", "1.0.1"),
        .Package(url: "https://github.com/IBM-Swift/SwiftyJSON.git", "14.2.0"),
        .Package(url: "https://github.com/IBM-Swift/swift-watson-sdk.git", "0.4.1"),
        .Package(url: "https://github.com/apple/example-package-deckofplayingcards.git", majorVersion: 3)
    ]
)
