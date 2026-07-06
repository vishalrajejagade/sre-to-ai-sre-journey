# Kubernetes Commands Practiced

## Cluster Check

```bash
kubectl get nodes
kubectl cluster-info
```

## Pod

```bash
kubectl apply -f pod.yaml
kubectl get pods
kubectl describe pod nginx-pod
```

## Deployment

```bash
kubectl apply -f deployment.yaml
kubectl get deployments
kubectl get pods
kubectl describe deployment nginx-deployment
```

## Service

```bash
kubectl apply -f service.yaml
kubectl get svc
minikube ip
curl http://$(minikube ip):30080
kubectl port-forward --address 0.0.0.0 service/nginx-service 8080:80
```

## ConfigMap

```bash
kubectl apply -f configmap.yaml
kubectl get configmap
kubectl describe configmap app-config
kubectl apply -f deployment-configmap.yaml
kubectl logs deployment/configmap-demo
```

## Secret

```bash
kubectl apply -f secret-example.yaml
kubectl get secret
kubectl describe secret app-secret
kubectl apply -f deployment-secret.yaml
kubectl logs deployment/secret-demo
```

## ReplicaSet

```bash
kubectl apply -f replicaset.yaml
kubectl get rs
kubectl get pods
kubectl delete pod <pod-name>
kubectl get pods
```

## Rolling Update

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.27
kubectl rollout status deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment
kubectl get pods -w
```

## Rollback

```bash
kubectl rollout undo deployment/nginx-deployment
kubectl rollout status deployment/nginx-deployment
kubectl describe deployment nginx-deployment | grep Image
```

## Probes

```bash
kubectl apply -f deployment.yaml
kubectl get pods
kubectl describe pod <pod-name>
kubectl get events --sort-by=.metadata.creationTimestamp
```

## Namespace

```bash
kubectl get namespaces
kubectl apply -f namespace.yaml
kubectl get namespaces
kubectl apply -f deployment.yaml -n dev
kubectl get all -n dev
```
