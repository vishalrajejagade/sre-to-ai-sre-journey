# Day 34 Commands

## StorageClass

```bash
kubectl get storageclass
kubectl describe storageclass default
```

## PVC

```bash
kubectl apply -f pvc.yaml
kubectl get pvc
kubectl describe pvc nginx-pvc
```

## PV

```bash
kubectl get pv
kubectl describe pv
```

## Deployment

```bash
kubectl apply -f deployment-pvc.yaml
kubectl get deployment
kubectl get pods
```

## Persistent Storage Test

```bash
kubectl exec -it <pod-name> -- sh

echo "Hello Vishal" > /usr/share/nginx/html/index.html
cat /usr/share/nginx/html/index.html

exit
```

Delete Pod:

```bash
kubectl delete pod <pod-name>
kubectl get pods -w
```

Verify File:

```bash
kubectl exec -it <new-pod-name> -- cat /usr/share/nginx/html/index.html
```

## Headless Service

```bash
kubectl apply -f headless-service.yaml
kubectl get svc
kubectl describe svc nginx-headless
```

## StatefulSet

```bash
kubectl apply -f statefulset.yaml
kubectl get statefulset
kubectl get pods
```

## Scale StatefulSet

```bash
kubectl scale statefulset nginx --replicas=3
kubectl get pods

kubectl scale statefulset nginx --replicas=1
kubectl get pods
```

## Validation

```bash
kubectl get storageclass
kubectl get pv
kubectl get pvc
kubectl get pods -o wide
kubectl get svc
kubectl get statefulset
```