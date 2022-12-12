# Kubernetes Example

## A2 - Introduction to Kubernetes

* A2.1 Deploy a local k8s cluster
* A2.2 Deploy your A1 Docker image as Deployment in A2.1 cluster
* A2.3 Deploy Ingress to expose A2.2 Deployment to your localhost

Follow the guide in demo/a2/ to complete the tasks.
Place your manifests in k8s/manifests/ and commands used in k8s/a2_setup.sh.

## A3 - Scalability and Availability

* A3.1 Deploy HorizontalPodAutoscaler that makes A2.2 Deployments scale up under load.
* A3.2 Modify your A2.2 Deployment to be distributed equally in each zone


Follow the guide in demo/a3/ to complete the tasks.
Place your manifests in k8s/manifests/ and commands used in k8s/a3_setup.sh.
