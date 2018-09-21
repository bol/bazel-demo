workspace(name = "bourne")

http_archive(
    name = "trans_maven_jar",
    strip_prefix = "migration-tooling-master",
    type = "zip",
    url = "https://github.com/bazelbuild/migration-tooling/archive/master.zip",
)

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = "29d109605e0d6f9c892584f07275b8c9260803bf0c6fcb7de2623b2bedc910bd",
    strip_prefix = "rules_docker-0.5.1",
    urls = ["https://github.com/bazelbuild/rules_docker/archive/v0.5.1.tar.gz"],
)

load("@trans_maven_jar//transitive_maven_jar:transitive_maven_jar.bzl", "transitive_maven_jar")

transitive_maven_jar(
    name = "dependencies",
    artifacts = [
        "org.springframework.boot:spring-boot-loader-tools:jar:2.0.5.RELEASE",
        "org.springframework.boot:spring-boot-starter-web:jar:2.0.5.RELEASE",
        "org.springframework.boot:spring-boot-starter-test:jar:2.0.5.RELEASE",
        "org.springframework.boot:spring-boot-starter-actuator:jar:2.0.5.RELEASE",
    ],
    repositories = ["http://central.maven.org/maven2/"],
)

load("@dependencies//:generate_workspace.bzl", "generated_maven_jars")

generated_maven_jars()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
    container_repositories = "repositories",
)

container_repositories()

container_pull(
    name = "java_base",
    registry = "index.docker.io",
    repository = "library/openjdk",
    tag = "8u171-jre-alpine3.8",
)
