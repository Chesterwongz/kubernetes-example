#!/bin/bash

echo "Step 3.1: Deployment of Metrics Server";
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml;
kubectl -n kube-system edit deploy/metrics-server;
kubectl -n kube-system rollout restart deploy/metrics-server;

echo "Step 3.2: Deployment of Horizontal Pod Autoscaler";
kubectl apply -f k8s/manifests/backend-HPA.yaml;

echo "Step 4.1: High Availability Topology";
kubectl get nodes -L topology.kubernetes.io/zone;
kubectl apply -f k8s/manifests/backend-zone-aware.yaml;
echo "Sleep 2s";
sleep 2;
kubectl get po -lapp=backend-zone-aware -owide --sort-by='.spec.nodeName';