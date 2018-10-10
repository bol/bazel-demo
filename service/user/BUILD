load("//tools/spring-boot:spring-boot.bzl", "boot_image")

java_library(
    name = "server",
    srcs = glob(include = ["src/main/java/**/*.java"]),
    resources = glob(include = ["src/main/resources/*"]),
    runtime_deps = [
        "//3rdparty/jvm/org/postgresql",
    ],
    deps = [
        "//3rdparty/jvm/org/springframework/boot:spring_boot_starter_actuator",
        "//3rdparty/jvm/org/springframework/boot:spring_boot_starter_data_jpa",
        "//3rdparty/jvm/org/springframework/boot:spring_boot_starter_data_rest",
        "//3rdparty/jvm/org/springframework/boot:spring_boot_starter_web",
    ],
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
        "//3rdparty/jvm/com/h2database:h2",
    ],
    deps = [
        "server",
        "//3rdparty/jvm/org/springframework/boot:spring_boot_starter_test",
    ],
)
