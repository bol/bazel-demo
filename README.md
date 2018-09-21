# Bourne
Sample project combining the build system Bazel with a java service written in Spring, using Skaffold as a dev tool and deploying to a local Kubernetes cluster using Helm.

### Setup
To start with, this project assumes that you are on a system where java means java 8 and python on version 2.

#### Minikube
Install [minikube](https://github.com/kubernetes/minikube) and start it up.
```
$ minikube start --kubernetes-version=v1.10.8
```

#### Helm
Install [helm](https://github.com/helm/helm) and use it to install tiller into your local cluster so that it will be able to deploy to it.
```
$ helm init
```

#### Bazel
Install [bazel](https://docs.bazel.build/versions/master/install.html) and test that everything is working by running the tests for the sample service
```
$ bazel test //service/hello:all
```

#### Skaffold
Install [skaffold](https://github.com/GoogleContainerTools/skaffold) and launch the sample service with it
```
$ cd service/hello
$ skaffold dev
```
If everything goes well it should end by showing you the startup log output of our sample service.
It should be a welcoming endpoint waiting for you at [http://localhost:8080/hello]().

Feel free to launch the kubernetes dashboard by now and inspect your handiwork in the cluster.
```
$ minikube dashboard
```
#### IntelliJ
There is a rather nice plugin for IntelliJ available that you might want to use. Unfortunately it's not compatible with the latest version of the IDE at the time of writing so I have a pre built version waiting for you in the Intellij folder.
If you want to build it yourself, clone the [repository](https://github.com/bazelbuild/intellij) and build it with
```
bazel build //ijwb:ijwb_bazel_zip --define=ij_product=intellij-ue-2018.2
```

When that is done, you are ready to import the project. Choose the root of the repository as the WORKSPACE and generate from the BUILD file located under **service/hello/BUILD**

Now go change some code and see how it is magically deployed to the cluster.
