load("@io_bazel_rules_k8s//k8s:object.bzl", "k8s_object")
load("@io_bazel_rules_k8s//k8s:objects.bzl", "k8s_objects")

k8s_objects(
    name = "full",
    objects = [
        ":custom_resource_definitions",
        ":demo_with_authentication",
        ":logging",
        ":log_rule",
    ],
)

k8s_object(
    name = "custom_resource_definitions",
    cluster = "minikube",
    namespace = "kube-system",
    template = ":crds.yaml",
)

k8s_object(
    name = "demo_with_authentication",
    cluster = "minikube",
    namespace = "istio-system",
    template = ":istio-demo-auth.yaml",
)

k8s_object(
    name = "logging",
    cluster = "minikube",
    namespace = "logging",
    template = ":logging-stack.yaml",
)

k8s_object(
    name = "log_rule",
    cluster = "minikube",
    namespace = "istio-system",
    template = ":fluentd-istio.yaml",
)
