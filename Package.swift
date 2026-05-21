// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SecretRabbitCode",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "libsamplerate",
            targets: ["libsamplerate"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libsamplerate",
            path: ".",
            exclude: [
                "src/CMakeLists.txt",
                "src/check_asm.sh",
                "src/Version_script.in",
            ],
            sources: ["src"],
            publicHeadersPath: "include",
            cSettings: [
                .define("PACKAGE", to: "\"SecretRabbitCode\""),
                .define("VERSION", to: "\"1.0.0\""),
                .define("ENABLE_SINC_BEST_CONVERTER", to: "1"),
                .define("ENABLE_SINC_MEDIUM_CONVERTER", to: "1"),
                .define("ENABLE_SINC_FAST_CONVERTER", to: "1"),
                .define("HAVE_STDBOOL_H", to: "1"),
            ]
        ),
        .testTarget(name: "SecretRabbitCodeTests", dependencies: ["libsamplerate"])
    ],
)
