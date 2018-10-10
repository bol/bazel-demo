load("@io_bazel_rules_k8s//k8s:object.bzl", "k8s_object")
load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "full",
    objects = [
        ":container_registry",
        ":demo_namespace",
    ],
)

k8s_object(
    name = "container_registry",
    cluster = "minikube",
    namespace = "kube-system",
    template = ":container-registry.yaml",
)

k8s_object(
    name = "demo_namespace",
    cluster = "minikube",
    namespace = "kube-system",
    template = ":demo-namespace.yaml",
)
