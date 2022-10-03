#!/bin/bash

echo "Step 1.1: Deployment of local cluster"
kind create cluster --name kind-1 --config k8s/kind/cluster-config.yaml;

echo "Step 1.2: Verify cluster is running on Docker"
docker ps;
kubectl get nodes; # Information about the nodes in k8s
kubectl cluster-info; # See if the control plane is running in localhost or 127.0.0.1 and the port matches kind-control-plane container's exposed port.

echo "Step 2.1: Load docker image";
kind load docker-image a1.1:latest --name kind-1;

echo "Step 2.2: Create Deployment of Docker Image";
kubectl apply -f k8s/manifests/backend-deployment.yaml;

echo "Step 2.3: Create Ingress controller";
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml;

echo "Step 2.4: Create Service for Deployment";
kubectl apply -f k8s/manifests/backend-service.yaml;
kubectl get svc; # Check service

echo "Step 2.5: Create Ingress object";
kubectl apply -f k8s/manifests/backend-ingress.yaml; # Usually needs to be run twice
kubectl get ingress; # Check ingress

echo "Step 2.6: Check Deployment"
kubectl get deployment/backend; # Check Deployment
kubectl get po -lapp=backend; # Check Deployment Pods