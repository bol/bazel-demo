load(
    "//tools/spring-boot:spring-boot.bzl",
    "boot_image",
    "spring_boot_starter_actuator_deps",
    "spring_boot_starter_data_jpa_deps",
    "spring_boot_starter_test_deps",
    "spring_boot_starter_web_deps",
)

java_library(
    name = "server",
    srcs = glob(include = ["src/main/java/**/*.java"]),
    resources = glob(include = ["src/main/resources/*"]),
    runtime_deps = [
        "@org_postgresql_postgresql//jar",
    ],
    deps = spring_boot_starter_web_deps +
           spring_boot_starter_data_jpa_deps +
           spring_boot_starter_actuator_deps,
)

boot_image(
    name = "server_image",
    target = ":server",
)

java_test(
    name = "application_test",
    size = "small",
    srcs = ["src/test/java/service/user/ApplicationTest.java"],
    test_class = "service.user.ApplicationTest",
    runtime_deps = [
        "@com_h2database_h2//jar",
    ],
    deps = ["server"] +
           spring_boot_starter_test_deps,
)
