# Day 27 - Kubernetes Basics

## Topics Covered

- Kubernetes basics
- Pod
- Deployment
- Service
- ConfigMap
- Secret
- kubectl commands
- Browser access using port-forward

## Practical Completed

- Created first Nginx Pod
- Created Nginx Deployment with 2 replicas
- Created NodePort Service
- Accessed Nginx from browser using port-forward
- Created ConfigMap
- Used ConfigMap values inside a Deployment
- Created Secret example
- Used Secret values inside a Deployment

## Commands Practiced

```bash
kubectl apply -f pod.yaml
kubectl get pods
kubectl describe pod nginx-pod

kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pods

kubectl apply -f service.yaml
kubectl get svc
minikube ip
curl http://$(minikube ip):30080
kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80

kubectl apply -f configmap.yaml
kubectl apply -f deployment-configmap.yaml
kubectl logs deployment/configmap-demo

kubectl apply -f secret-example.yaml
kubectl apply -f deployment-secret.yaml
kubectl logs deployment/secret-demo
```

## Key Learnings

- Pod is the smallest deployable unit in Kubernetes.
- Deployment manages Pods and maintains replicas.
- Service provides stable access to Pods.
- ConfigMap stores non-sensitive configuration.
- Secret stores sensitive configuration.
- `kubectl` is used to interact with Kubernetes resources.

> Note: `secret-example.yaml` contains demo values only. Do not commit real secrets to GitHub.
