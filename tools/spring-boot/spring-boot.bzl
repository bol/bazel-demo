def _boot_jar_impl(ctx):
    deps = ctx.attr.target.java.transitive_runtime_deps + ctx.attr._spring_boot_loader.java.transitive_runtime_deps
    args = ctx.actions.args()
    args.add(ctx.attr.include_launch_script)
    args.add(ctx.file.target.path)
    args.add(ctx.outputs.executable.path)
    args.add([d.path for d in deps])

    ctx.actions.run(
        inputs = deps + [ctx.file.target],
        outputs = [ctx.outputs.executable],
        executable = ctx.executable._spring_boot_packager,
        arguments = [args],
    )

_pkg_boot_jar = rule(
    attrs = {
        "target": attr.label(allow_single_file = [".jar"]),
        "include_launch_script": attr.bool(),
        "_spring_boot_loader": attr.label(allow_single_file = [".jar"], default = "@org_springframework_boot_spring_boot_loader_tools//jar"),
        "_spring_boot_packager": attr.label(executable = True, cfg = "host", default = "//tools/spring-boot:spring_boot_packager"),
    },
    fragments = ["jvm"],
    host_fragments = ["jvm"],
    implementation = _boot_jar_impl,
    executable = True,
)

def boot_jar(name, target, include_launch_script = True, **kwargs):
    _pkg_boot_jar(
        name = name,
        target = target,
        include_launch_script = include_launch_script,
        **kwargs
    )

spring_boot_starter_web_deps = [
    "@ch_qos_logback_logback_classic//jar",
    "@ch_qos_logback_logback_core//jar",
    "@com_fasterxml_classmate//jar",
    "@com_fasterxml_jackson_core_jackson_annotations//jar",
    "@com_fasterxml_jackson_core_jackson_core//jar",
    "@com_fasterxml_jackson_core_jackson_databind//jar",
    "@com_fasterxml_jackson_datatype_jackson_datatype_jdk8//jar",
    "@com_fasterxml_jackson_datatype_jackson_datatype_jsr310//jar",
    "@com_fasterxml_jackson_module_jackson_module_parameter_names//jar",
    "@javax_annotation_javax_annotation_api//jar",
    "@javax_validation_validation_api//jar",
    "@org_apache_logging_log4j_log4j_to_slf4j//jar",
    "@org_apache_tomcat_embed_tomcat_embed_core//jar",
    "@org_apache_tomcat_embed_tomcat_embed_el//jar",
    "@org_apache_tomcat_embed_tomcat_embed_websocket//jar",
    "@org_hibernate_validator_hibernate_validator//jar",
    "@org_jboss_logging_jboss_logging//jar",
    "@org_slf4j_jul_to_slf4j//jar",
    "@org_slf4j_slf4j_api//jar",
    "@org_springframework_boot_spring_boot//jar",
    "@org_springframework_boot_spring_boot_autoconfigure//jar",
    "@org_springframework_boot_spring_boot_starter_json//jar",
    "@org_springframework_boot_spring_boot_starter_logging//jar",
    "@org_springframework_boot_spring_boot_starter_tomcat//jar",
    "@org_springframework_boot_spring_boot_starter_web//jar",
    "@org_springframework_spring_aop//jar",
    "@org_springframework_spring_beans//jar",
    "@org_springframework_spring_context//jar",
    "@org_springframework_spring_core//jar",
    "@org_springframework_spring_expression//jar",
    "@org_springframework_spring_jcl//jar",
    "@org_springframework_spring_web//jar",
    "@org_springframework_spring_webmvc//jar",
    "@org_yaml_snakeyaml//jar",
]

spring_boot_starter_actuator_deps = [
    "@io_micrometer_micrometer_core//jar",
    "@org_latencyutils_LatencyUtils//jar",
    "@org_hdrhistogram_HdrHistogram//jar",
    "@org_springframework_boot_spring_boot_actuator//jar",
    "@org_springframework_boot_spring_boot_actuator_autoconfigure//jar",
    "@org_springframework_boot_spring_boot_starter_actuator//jar",
]

spring_boot_starter_test_deps = [
    "@com_jayway_jsonpath_json_path//jar",
    "@com_vaadin_external_google_android_json//jar",
    "@junit_junit//jar",
    "@net_bytebuddy_byte_buddy//jar",
    "@net_bytebuddy_byte_buddy_agent//jar",
    "@net_minidev_accessors_smart//jar",
    "@net_minidev_json_smart//jar",
    "@org_assertj_assertj_core//jar",
    "@org_hamcrest_hamcrest_core//jar",
    "@org_mockito_mockito_core//jar",
    "@org_objenesis_objenesis//jar",
    "@org_ow2_asm_asm//jar",
    "@org_skyscreamer_jsonassert//jar",
    "@org_springframework_boot_spring_boot_test//jar",
    "@org_springframework_boot_spring_boot_test_autoconfigure//jar",
    "@org_springframework_spring_test//jar",
    "@org_xmlunit_xmlunit_core//jar",
]
