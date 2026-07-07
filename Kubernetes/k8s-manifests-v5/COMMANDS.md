
# Day 33 Advanced Networking Commands

## Verify Context

kubectl config current-context
kubectl get nodes

## Apply Resources

kubectl apply -f namespace.yaml
kubectl apply -f deployment.yaml
kubectl apply -f clusterip-service.yaml

## Inspect Services

kubectl get svc -n day33-advanced
kubectl describe svc nginx-clusterip -n day33-advanced
kubectl get endpoints -n day33-advanced
kubectl get pods -o wide -n day33-advanced

## DNS Test

kubectl run dns-test -n day33-advanced --image=busybox:1.36 --restart=Never -- sleep 3600
kubectl exec -it dns-test -n day33-advanced -- sh

Inside Pod:

nslookup kubernetes.default
nslookup nginx-clusterip
nslookup nginx-clusterip.day33-advanced.svc.cluster.local
wget -qO- http://nginx-clusterip
exit

## LoadBalancer

kubectl apply -f loadbalancer-service.yaml
kubectl get svc nginx-loadbalancer -n day33-advanced -w
curl http://<EXTERNAL-IP>

## Ingress Checks

kubectl get ingress -A
kubectl get ingressclass
kubectl get pods -A | grep ingress

## NetworkPolicy

kubectl apply -f networkpolicy-example.yaml
kubectl get networkpolicy -n day33-advanced
kubectl describe networkpolicy allow-frontend-to-nginx -n day33-advanced

## Events

kubectl get events -n day33-advanced --sort-by=.metadata.creationTimestamp

## Cleanup

kubectl delete -f loadbalancer-service.yaml
kubectl delete namespace day33-advanced
