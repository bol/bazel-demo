java_library(
    name = "spring_data_commons",
    exports = [
        "//3rdparty/jvm/org/slf4j:slf4j_api",
        "//3rdparty/jvm/org/springframework:spring_beans",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//external:jar/org/springframework/data/spring_data_commons"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_data_jpa",
    exports = [
        "//3rdparty/jvm/org/slf4j:slf4j_api",
        "//3rdparty/jvm/org/springframework:spring_aop",
        "//3rdparty/jvm/org/springframework:spring_beans",
        "//3rdparty/jvm/org/springframework:spring_context",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//3rdparty/jvm/org/springframework:spring_orm",
        "//3rdparty/jvm/org/springframework:spring_tx",
        "//external:jar/org/springframework/data/spring_data_jpa",
        ":spring_data_commons"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


