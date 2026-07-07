
# Day 33 Advanced - Kubernetes Networking in AKS

## Topics Covered

- ClusterIP Service
- LoadBalancer Service
- Kubernetes Service Discovery
- CoreDNS
- Endpoints
- Ingress architecture
- TLS/HTTPS Ingress concept
- NetworkPolicy basics
- AKS networking flow

## Architecture

Internet
  ↓
Azure Public IP
  ↓
Azure Load Balancer
  ↓
Ingress Controller
  ↓
Ingress Rules
  ↓
ClusterIP Service
  ↓
Endpoints
  ↓
Pods

## Practical Completed

- Created namespace day33-advanced
- Created nginx Deployment
- Created ClusterIP Service
- Verified Endpoints
- Tested DNS using BusyBox
- Created LoadBalancer Service example
- Created Ingress example
- Created TLS Ingress example
- Created NetworkPolicy example

## Service Discovery

Kubernetes Pods can communicate using Service DNS names.

Example:

nginx-clusterip.day33-advanced.svc.cluster.local

## Ingress

Ingress is used for HTTP/HTTPS routing to multiple services using host-based or path-based rules.

## TLS / HTTPS

TLS Ingress uses a Kubernetes TLS Secret containing certificate and private key.

## NetworkPolicy

NetworkPolicy controls which Pods are allowed to communicate with selected Pods.

## Cleanup

Delete LoadBalancer service:

kubectl delete -f loadbalancer-service.yaml

Delete full namespace:

kubectl delete namespace day33-advanced
