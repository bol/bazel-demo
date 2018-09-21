load(
    "//tools/spring-boot:spring-boot.bzl",
    "boot_jar",
    "spring_boot_starter_actuator_deps",
    "spring_boot_starter_test_deps",
    "spring_boot_starter_web_deps",
)

java_library(
    name = "hello_library",
    srcs = glob(include = ["src/**/*.java"]),
    visibility = ["//visibility:private"],
    deps = spring_boot_starter_web_deps +
           spring_boot_starter_actuator_deps,
)

boot_jar(
    name = "hello_boot_jar",
    target = ":hello_library",
)

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

container_image(
    name = "hello_image",
    base = "@java_base//image",
    cmd = [
        "/usr/bin/java",
        "-jar",
        "/hello_boot_jar",
    ],
    files = [":hello_boot_jar"],
)

java_test(
    name = "hello_tests",
    size = "small",
    srcs = ["tests/ApplicationTest.java"],
    test_class = "test.ApplicationTest",
    deps = ["hello_library"] +
           spring_boot_starter_web_deps +
           spring_boot_starter_actuator_deps +
           spring_boot_starter_test_deps,
)
