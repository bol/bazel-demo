load("@k8s_deploy//:defaults.bzl", "k8s_deploy")
load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "full",
    objects = [
        ":database",
        ":server",
    ],
)

k8s_objects(
    name = "server",
    objects = [
        ":_k8s_service_server",
        ":_k8s_deployment_server",
    ],
)

k8s_objects(
    name = "database",
    objects = [
        ":_k8s_persistantvolume_db",
        ":_k8s_persistantvolumeclaim_db",
        ":_k8s_service_db",
        ":_k8s_deployment_db",
    ],
)

k8s_deploy(
    name = "_k8s_service_server",
    kind = "Service",
    template = ":server-service.yaml",
)

k8s_deploy(
    name = "_k8s_deployment_server",
    images = {"user_server:dev": "//service/user:server_image"},
    kind = "Deployment",
    template = ":server-deployment.yaml",
)

k8s_deploy(
    name = "_k8s_service_db",
    kind = "Service",
    template = ":db-service.yaml",
)

k8s_deploy(
    name = "_k8s_deployment_db",
    kind = "Deployment",
    template = ":db-deployment.yaml",
)

k8s_deploy(
    name = "_k8s_persistantvolume_db",
    kind = "PersistantVolume",
    template = ":db-pv.yaml",
)

k8s_deploy(
    name = "_k8s_persistantvolumeclaim_db",
    kind = "PersistantVolumeClaim",
    template = ":db-pvc.yaml",
)
