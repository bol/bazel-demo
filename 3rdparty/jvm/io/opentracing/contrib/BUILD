java_library(
    name = "opentracing_jdbc",
    exports = [
        "//external:jar/io/opentracing/contrib/opentracing_jdbc"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "opentracing_spring_cloud_jdbc_starter",
    exports = [
        "//3rdparty/jvm/io/opentracing:opentracing_api",
        "//3rdparty/jvm/org/springframework/boot:spring_boot_starter_aop",
        "//external:jar/io/opentracing/contrib/opentracing_spring_cloud_jdbc_starter",
        ":opentracing_jdbc",
        ":opentracing_spring_tracer_configuration_starter"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "opentracing_spring_jaeger_starter",
    exports = [
        "//3rdparty/jvm/io/jaegertracing:jaeger_client",
        "//3rdparty/jvm/io/opentracing:opentracing_api",
        "//external:jar/io/opentracing/contrib/opentracing_spring_jaeger_starter",
        ":opentracing_spring_tracer_configuration_starter"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "opentracing_spring_tracer_configuration_starter",
    exports = [
        "//3rdparty/jvm/io/opentracing:opentracing_noop",
        "//3rdparty/jvm/io/opentracing:opentracing_util",
        "//3rdparty/jvm/org/springframework/boot:spring_boot_autoconfigure",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//external:jar/io/opentracing/contrib/opentracing_spring_tracer_configuration_starter",
        ":opentracing_tracerresolver"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "opentracing_spring_web",
    exports = [
        "//external:jar/io/opentracing/contrib/opentracing_spring_web",
        ":opentracing_web_servlet_filter"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "opentracing_spring_web_starter",
    exports = [
        "//3rdparty/jvm/org/springframework/boot:spring_boot_autoconfigure",
        "//external:jar/io/opentracing/contrib/opentracing_spring_web_starter",
        ":opentracing_spring_tracer_configuration_starter",
        ":opentracing_spring_web",
        ":opentracing_tracerresolver"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "opentracing_tracerresolver",
    exports = [
        "//3rdparty/jvm/io/opentracing:opentracing_api",
        "//external:jar/io/opentracing/contrib/opentracing_tracerresolver"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "opentracing_web_servlet_filter",
    exports = [
        "//3rdparty/jvm/io/opentracing:opentracing_api",
        "//3rdparty/jvm/io/opentracing:opentracing_util",
        "//external:jar/io/opentracing/contrib/opentracing_web_servlet_filter"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


