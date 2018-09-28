load(
    "//tools/spring-boot:spring-boot.bzl",
    "boot_image",
    "spring_boot_starter_actuator_deps",
    "spring_boot_starter_data_jpa_deps",
    "spring_boot_starter_test_deps",
    "spring_boot_starter_web_deps",
)

java_library(
    name = "library",
    srcs = glob(include = ["src/main/java/**/*.java"]),
    resources = glob(include = ["src/main/resources/*"]),
    runtime_deps = [
        "@org_postgresql_postgresql//jar",
    ],
    deps = spring_boot_starter_web_deps +
           spring_boot_starter_data_jpa_deps +
           spring_boot_starter_actuator_deps,
)

java_test(
    name = "tests",
    size = "small",
    srcs = ["src/test/java/service/user/ApplicationTest.java"],
    test_class = "service.user.ApplicationTest",
    runtime_deps = [
        "@com_h2database_h2//jar",
    ],
    deps = ["library"] +
           spring_boot_starter_test_deps,
)

boot_image(
    name = "app",
    target = ":library",
)

load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "deploy",
    objects = [
        ":deploy_database",
        ":deploy_app",
    ],
)

k8s_objects(
    name = "deploy_app",
    objects = [
        ":_k8s_service_app",
        ":_k8s_deployment_app",
    ],
)

k8s_objects(
    name = "deploy_database",
    objects = [
        ":_k8s_persistantvolume_db",
        ":_k8s_persistantvolumeclaim_db",
        ":_k8s_service_db",
        ":_k8s_deployment_db",
    ],
)

load("@k8s_deploy//:defaults.bzl", "k8s_deploy")

k8s_deploy(
    name = "_k8s_service_app",
    kind = "Service",
    template = ":deployment/app-service.yaml",
)

k8s_deploy(
    name = "_k8s_deployment_app",
    images = {"app:dev": ":app"},
    kind = "Deployment",
    template = ":deployment/app-deployment.yaml",
)

k8s_deploy(
    name = "_k8s_service_db",
    kind = "Service",
    template = ":deployment/db-service.yaml",
)

k8s_deploy(
    name = "_k8s_deployment_db",
    kind = "Deployment",
    template = ":deployment/db-deployment.yaml",
)

k8s_deploy(
    name = "_k8s_persistantvolume_db",
    kind = "PersistantVolume",
    template = ":deployment/db-pv.yaml",
)

k8s_deploy(
    name = "_k8s_persistantvolumeclaim_db",
    kind = "PersistantVolumeClaim",
    template = ":deployment/db-pvc.yaml",
)
