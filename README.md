# Bourne
Sample project combining the build system Bazel with a java service written in Spring, deploying to a local Kubernetes cluster.

### Setup
To start with, this project assumes that you are on a system where java means java 8 and python on version 2.

#### Minikube
Install [minikube](https://github.com/kubernetes/minikube) and start it up.
```bash
$ minikube start --kubernetes-version=v1.10.8
```
Feel free to launch the kubernetes dashboard by now and inspect your handiwork in the cluster.
```bash
$ minikube dashboard
```
#### Bazel
Install [bazel](https://docs.bazel.build/versions/master/install.html) and use it to build all code in the repository, this can be a little slow the first time but should be rapid after that.
```bash
$ bazel build //...:all
```

We can also run all tests to verify that everything works.
```bash
$ bazel test //...:all
```

#### Registry
Before we can deploy anything there has to be a repository which the build system can push and from where the cluster can pull images.
We'll set up a simple one inside minikube.
```bash
$ kubectl create -f deployment/dev/kube-registry.yaml
```

Then forward the port to localhost so that your local system can reach it.
Note that this command does not exit and must run as long as you want to publish new images to the registry.
```bash
$ kubectl port-forward --namespace kube-system $(kubectl get pods -n kube-system -l 'k8s-app=kube-registry,version=v0' -o name) 5000:5000
```


#### Deployment
Lets test the setup by deploying the last build version of the user service to our cluster.
```bash
$ bazel run //service/user:deploy.apply
```

#### IntelliJ
There is a rather nice plugin for IntelliJ available that you might want to use. Unfortunately it's not compatible with the latest version of the IDE at the time of writing so I have a pre built version waiting for you in the Intellij folder.
If you want to build it yourself, clone the [repository](https://github.com/bazelbuild/intellij) and build it with
```bash
$ bazel build //ijwb:ijwb_bazel_zip --define=ij_product=intellij-ue-2018.2
```

When that is done, you are ready to import the project. Choose the root of the repository as the WORKSPACE and generate from the BUILD file located under **service/hello/BUILD**

Now go change some code and see how it is magically deployed to the cluster.
