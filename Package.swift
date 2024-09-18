// swift-tools-version: 5.5

import PackageDescription

let package = Package(
  name: "GooglePlaces", platforms: [.iOS(.v15)],
  products: [
    .library(name: "GooglePlaces", targets: ["GooglePlacesTarget"]),
    .library(name: "GooglePlacesSwift", targets: ["GooglePlacesSwiftTarget"])
  ], dependencies: [],
  targets: [
    .binaryTarget(
      name: "GooglePlaces",
      url: "https://dl.google.com/geosdk/swiftpm/9.1.0/GooglePlaces_3p.xcframework.zip",
      checksum: "af996bead6be75ae063c7c740f8fade78a3f66a4743050522bc9b4da708c9d3c"
    ),
    .target(
      name: "GooglePlacesTarget",
      dependencies: ["GooglePlaces"],
      path: "Places",
      sources: ["GMSEmpty.m"],
      resources: [.copy("Resources/GooglePlacesResources/GooglePlaces.bundle")],
      publicHeadersPath: "Sources",
      linkerSettings: [
        .linkedLibrary("c++"),
        .linkedLibrary("z"),
        .linkedFramework("CoreGraphics"),
        .linkedFramework("CoreLocation"),
        .linkedFramework("QuartzCore"),
        .linkedFramework("Security"),
        .linkedFramework("UIKit"),
      ]
    ),
    .binaryTarget(
      name: "GooglePlacesSwift",
      url: "https://dl.google.com/geosdk/swiftpm/0.2.0/google_places_swift.xcframework.zip",
      checksum: "0b1daed4bff0d629fe9f939577b16a985ccbb8af9df42d5682ff09a22cf619b4"
    ),
    .target(
      name: "GooglePlacesSwiftTarget",
      dependencies: [
        "GooglePlacesSwift",
        "GooglePlacesTarget",
      ],
      path: "PlacesSwift",
      sources: ["Empty.swift"],
      resources: [.copy("Resources/GooglePlacesSwiftResources/GooglePlacesSwift.bundle")],
      publicHeadersPath: "Sources"
    ),
  ]
)
