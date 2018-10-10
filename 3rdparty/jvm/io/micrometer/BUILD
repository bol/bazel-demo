java_library(
    name = "micrometer_core",
    exports = [
        "//3rdparty/jvm/org/hdrhistogram:HdrHistogram",
        "//3rdparty/jvm/org/latencyutils:LatencyUtils",
        "//external:jar/io/micrometer/micrometer_core"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "micrometer_registry_prometheus",
    exports = [
        "//3rdparty/jvm/io/prometheus:simpleclient_common",
        "//external:jar/io/micrometer/micrometer_registry_prometheus",
        ":micrometer_core"
    ],
    visibility = [
        "//visibility:public"
    ]
)


