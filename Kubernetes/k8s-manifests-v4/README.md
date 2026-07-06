# Day 33 - Kubernetes Advanced Networking

## Topics Covered

- ClusterIP
- NodePort
- LoadBalancer
- Service Discovery
- Kubernetes DNS
- Endpoints
- Ingress architecture
- NetworkPolicy basics
- AKS networking flow

## Practical Completed

- Created namespace day33
- Created nginx Deployment
- Created ClusterIP Service
- Verified endpoints
- Tested DNS from BusyBox Pod
- Created LoadBalancer Service on AKS
- Created Ingress example YAML
- Created NetworkPolicy example YAML

## Commands Practiced

```bash
kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f clusterip-service.yaml

kubectl get all -n day33
kubectl get svc -n day33
kubectl get endpoints -n day33
kubectl get pods -o wide -n day33

kubectl run dns-test -n day33 --image=busybox:1.36 --restart=Never -- sleep 3600
kubectl exec -it dns-test -n day33 -- sh

kubectl apply -f loadbalancer-service.yaml
kubectl get svc nginx-loadbalancer -n day33 -w

kubectl apply -f networkpolicy-example.yaml
kubectl get networkpolicy -n day33