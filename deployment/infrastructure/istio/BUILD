load("@io_bazel_rules_k8s//k8s:object.bzl", "k8s_object")
load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "full",
    objects = [
        ":custom_resource_definitions",
        ":istio_with_authentication",
    ],
)

k8s_object(
    name = "custom_resource_definitions",
    cluster = "minikube",
    namespace = "kube-system",
    template = ":crds.yaml",
)

k8s_object(
    name = "istio_with_authentication",
    cluster = "minikube",
    namespace = "istio-system",
    template = ":istio-demo-auth.yaml",
)
