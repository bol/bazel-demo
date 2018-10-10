java_library(
    name = "spring_boot",
    exports = [
        "//3rdparty/jvm/org/springframework:spring_context",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//external:jar/org/springframework/boot/spring_boot"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_actuator",
    exports = [
        "//external:jar/org/springframework/boot/spring_boot_actuator",
        ":spring_boot"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_actuator_autoconfigure",
    exports = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson_databind",
        "//3rdparty/jvm/com/fasterxml/jackson/datatype:jackson_datatype_jsr310",
        "//3rdparty/jvm/org/springframework:spring_context",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//external:jar/org/springframework/boot/spring_boot_actuator_autoconfigure",
        ":spring_boot_actuator",
        ":spring_boot_autoconfigure"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_autoconfigure",
    exports = [
        "//external:jar/org/springframework/boot/spring_boot_autoconfigure",
        ":spring_boot"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_loader_tools",
    exports = [
        "//3rdparty/jvm/org/apache/commons:commons_compress",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//external:jar/org/springframework/boot/spring_boot_loader_tools"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "spring_boot_starter",
    exports = [
        "//3rdparty/jvm/javax/annotation:javax_annotation_api",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//3rdparty/jvm/org/yaml:snakeyaml",
        "//external:jar/org/springframework/boot/spring_boot_starter",
        ":spring_boot",
        ":spring_boot_autoconfigure",
        ":spring_boot_starter_logging"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_starter_actuator",
    exports = [
        "//3rdparty/jvm/io/micrometer:micrometer_core",
        "//external:jar/org/springframework/boot/spring_boot_starter_actuator",
        ":spring_boot_actuator_autoconfigure",
        ":spring_boot_starter"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "spring_boot_starter_aop",
    exports = [
        "//3rdparty/jvm/org/aspectj:aspectjweaver",
        "//3rdparty/jvm/org/springframework:spring_aop",
        "//external:jar/org/springframework/boot/spring_boot_starter_aop",
        ":spring_boot_starter"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_starter_data_jpa",
    exports = [
        "//3rdparty/jvm/javax/transaction:javax_transaction_api",
        "//3rdparty/jvm/org/hibernate:hibernate_core",
        "//3rdparty/jvm/org/springframework/data:spring_data_jpa",
        "//3rdparty/jvm/org/springframework:spring_aspects",
        "//external:jar/org/springframework/boot/spring_boot_starter_data_jpa",
        ":spring_boot_starter",
        ":spring_boot_starter_aop",
        ":spring_boot_starter_jdbc"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "spring_boot_starter_data_rest",
    exports = [
        "//3rdparty/jvm/org/springframework/data:spring_data_rest_webmvc",
        "//external:jar/org/springframework/boot/spring_boot_starter_data_rest",
        ":spring_boot_starter",
        ":spring_boot_starter_json",
        ":spring_boot_starter_web"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "spring_boot_starter_jdbc",
    exports = [
        "//3rdparty/jvm/com/zaxxer:HikariCP",
        "//3rdparty/jvm/org/springframework:spring_jdbc",
        "//external:jar/org/springframework/boot/spring_boot_starter_jdbc",
        ":spring_boot_starter"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_starter_json",
    exports = [
        "//3rdparty/jvm/com/fasterxml/jackson/core:jackson_databind",
        "//3rdparty/jvm/com/fasterxml/jackson/datatype:jackson_datatype_jdk8",
        "//3rdparty/jvm/com/fasterxml/jackson/datatype:jackson_datatype_jsr310",
        "//3rdparty/jvm/com/fasterxml/jackson/module:jackson_module_parameter_names",
        "//3rdparty/jvm/org/springframework:spring_web",
        "//external:jar/org/springframework/boot/spring_boot_starter_json",
        ":spring_boot_starter"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_starter_logging",
    exports = [
        "//3rdparty/jvm/ch/qos/logback:logback_classic",
        "//3rdparty/jvm/org/apache/logging/log4j:log4j_to_slf4j",
        "//3rdparty/jvm/org/slf4j:jul_to_slf4j",
        "//external:jar/org/springframework/boot/spring_boot_starter_logging"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_starter_test",
    exports = [
        "//3rdparty/jvm/com/jayway/jsonpath:json_path",
        "//3rdparty/jvm/junit:junit",
        "//3rdparty/jvm/org/assertj:assertj_core",
        "//3rdparty/jvm/org/hamcrest:hamcrest_core",
        "//3rdparty/jvm/org/hamcrest:hamcrest_library",
        "//3rdparty/jvm/org/mockito:mockito_core",
        "//3rdparty/jvm/org/skyscreamer:jsonassert",
        "//3rdparty/jvm/org/springframework:spring_core",
        "//3rdparty/jvm/org/springframework:spring_test",
        "//3rdparty/jvm/org/xmlunit:xmlunit_core",
        "//external:jar/org/springframework/boot/spring_boot_starter_test",
        ":spring_boot_starter",
        ":spring_boot_test",
        ":spring_boot_test_autoconfigure"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "spring_boot_starter_tomcat",
    exports = [
        "//3rdparty/jvm/javax/annotation:javax_annotation_api",
        "//3rdparty/jvm/org/apache/tomcat/embed:tomcat_embed_core",
        "//3rdparty/jvm/org/apache/tomcat/embed:tomcat_embed_el",
        "//3rdparty/jvm/org/apache/tomcat/embed:tomcat_embed_websocket",
        "//external:jar/org/springframework/boot/spring_boot_starter_tomcat"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_starter_web",
    exports = [
        "//3rdparty/jvm/org/hibernate/validator:hibernate_validator",
        "//3rdparty/jvm/org/springframework:spring_web",
        "//3rdparty/jvm/org/springframework:spring_webmvc",
        "//external:jar/org/springframework/boot/spring_boot_starter_web",
        ":spring_boot_starter",
        ":spring_boot_starter_json",
        ":spring_boot_starter_tomcat"
    ],
    visibility = [
        "//visibility:public"
    ]
)



java_library(
    name = "spring_boot_test",
    exports = [
        "//external:jar/org/springframework/boot/spring_boot_test",
        ":spring_boot"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)



java_library(
    name = "spring_boot_test_autoconfigure",
    exports = [
        "//external:jar/org/springframework/boot/spring_boot_test_autoconfigure",
        ":spring_boot_autoconfigure",
        ":spring_boot_test"
    ],
    visibility = [
        "//3rdparty/jvm:__subpackages__"
    ]
)


