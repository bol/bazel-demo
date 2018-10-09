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

# Creates a spring boot executable jar from a java library
def boot_jar(name, target, include_launch_script = True, **kwargs):
    _pkg_boot_jar(
        name = name,
        target = target,
        include_launch_script = include_launch_script,
        **kwargs
    )

load("@io_bazel_rules_docker//container:container.bzl", "container_image")

# Convenience function that creates a runable container image
# from a library with a spring boot application inside
def boot_image(
        name,
        target,
        base = "@java_base//image",
        stamp = True,
        visibility = ["//visibility:public"],
        **kwargs):
    jar_name = name + ".jar"

    boot_jar(
        name = jar_name,
        target = target,
        **kwargs
    )

    container_image(
        name = name,
        base = base,
        cmd = ["/" + jar_name],
        files = [jar_name],
        stamp = stamp,
        visibility = visibility,
    )
