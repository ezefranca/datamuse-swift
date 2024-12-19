//
//  datamuse-swift.swift
//  datamuse-swift
//
//  Created by Ezequiel França on 23/10/15.
//  Copyright © 2017 ezefranca. All rights reserved.
//

// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "datamuse-swift",
    products: [
        .library(
            name: "datamuse-swift",
            targets: ["datamuse-swift"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "datamuse-swift",
            dependencies: []),
        .testTarget(
            name: "datamuse-swiftTests",
            dependencies: ["datamuse-swift"]),
    ]
)
