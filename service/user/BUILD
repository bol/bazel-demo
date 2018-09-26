load(
    "//tools/spring-boot:spring-boot.bzl",
    "boot_jar",
    "spring_boot_starter_actuator_deps",
    "spring_boot_starter_test_deps",
    "spring_boot_starter_web_deps",
)

java_library(
    name = "library",
    srcs = glob(include = ["src/**/*.java"]),
    visibility = ["//visibility:private"],
    deps = spring_boot_starter_web_deps +
           spring_boot_starter_actuator_deps,
)

java_test(
    name = "tests",
    size = "small",
    srcs = ["tests/ApplicationTest.java"],
    test_class = "test.ApplicationTest",
    deps = ["library"] +
           spring_boot_starter_web_deps +
           spring_boot_starter_actuator_deps +
           spring_boot_starter_test_deps,
)

boot_jar(
    name = "app.jar",
    target = ":library",
)

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

container_image(
    name = "image",
    base = "@java_base//image",
    cmd = ["/app.jar"],
    files = [":app.jar"],
    stamp = True,
)

load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "deploy",
    objects = [
        ":deploy_database",
        ":deploy_application",
    ],
)

k8s_objects(
    name = "deploy_application",
    objects = [
        ":app_service",
        ":app_deploy",
    ],
)

k8s_objects(
    name = "deploy_database",
    objects = [
        ":db_pv",
        ":db_pvc",
        ":db_service",
        ":db_deploy",
    ],
)

load("@k8s_deploy//:defaults.bzl", "k8s_deploy")

k8s_deploy(
    name = "app_service",
    template = ":deployment/app-service.yaml",
)

k8s_deploy(
    name = "app_deploy",
    images = {"app:dev": ":image"},
    template = ":deployment/app-deployment.yaml",
)

k8s_deploy(
    name = "db_service",
    template = ":deployment/db-service.yaml",
)

k8s_deploy(
    name = "db_deploy",
    template = ":deployment/db-deployment.yaml",
)

k8s_deploy(
    name = "db_pv",
    template = ":deployment/db-pv.yaml",
)

k8s_deploy(
    name = "db_pvc",
    template = ":deployment/db-pvc.yaml",
)
