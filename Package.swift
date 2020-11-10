// swift-tools-version:5.3
import PackageDescription


#if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
let package = Package(
  name: "JWT",
  products: [
    .library(name: "JWT", targets: ["JWT"])
  ],
    dependencies: [
      .package(url: "https://github.com/sp0n-7/CommonCrypto.git", requirement: .branch("spm/update"),
    ],
  targets: [
    .target(
      name: "JWT",
      dependencies: ["CommonCrypto"],
      path: "Sources",
      exclude: [
        "Sources/HMACCryptoSwift.swift",
      ]
    )
  ]
)

#else
let package = Package(
  name: "JWT",
  dependencies: [
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", majorVersion: 0, minor: 6),
  ],
  exclude: [
    "Sources/HMACCommonCrypto.swift",
  ]
)
#endif
