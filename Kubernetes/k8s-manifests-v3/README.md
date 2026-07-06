# Day 29 - Kubernetes Resources, Scheduler and HPA Basics

## Topics Covered

- CPU and memory requests
- CPU and memory limits
- QoS classes
- Kubernetes Scheduler
- Node capacity and allocatable resources
- Metrics Server
- kubectl top
- Horizontal Pod Autoscaler

## Practical Completed

- Created a Deployment with CPU and memory requests
- Added CPU and memory limits
- Verified Requests, Limits and QoS Class
- Checked node capacity and allocated resources
- Checked Pod placement using kubectl get pods -o wide
- Enabled Metrics Server
- Created HPA for nginx-resources deployment

## Commands Practiced

```bash
kubectl apply -f deployment-resources.yaml
kubectl get deployment nginx-resources
kubectl get pods | grep nginx-resources
kubectl describe pod <pod-name>

kubectl describe node minikube
kubectl get pods -o wide

kubectl top node
kubectl top pod

kubectl apply -f hpa.yaml
kubectl get hpa
kubectl describe hpa nginx-resources