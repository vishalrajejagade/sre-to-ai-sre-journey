# ☸️ Kubernetes & AKS Operations

## Overview

This project documents my hands-on learning and operational experience with Kubernetes and Azure Kubernetes Service (AKS).

The focus is on container orchestration, platform reliability, workload troubleshooting, monitoring, and production operations.

---

## Technologies

- Kubernetes
- Azure Kubernetes Service (AKS)
- Docker
- Linux
- Azure
- Monitoring & Observability

---

## Topics Covered

### Kubernetes Fundamentals

- Pods
- Deployments
- Services
- Namespaces
- ConfigMaps
- Secrets

---

### Workload Management

- ReplicaSets
- Rolling Updates
- Self Healing
- Deployment Validation

---

### Health Probes

- Liveness Probe
- Readiness Probe
- Startup Probe

Purpose:

```text
Keep applications healthy and available.
```

---

### Resource Management

- CPU Requests
- CPU Limits
- Memory Requests
- Memory Limits

Goal:

```text
Improve cluster stability and avoid resource starvation.
```

---

### AKS Operations

- AKS Architecture
- Node Pools
- Scaling Concepts
- Azure Integration
- Cluster Administration

---

### Troubleshooting

Commands Practiced

```bash
kubectl get pods

kubectl describe pod

kubectl logs

kubectl get events

kubectl rollout status
```

---

### Common Issues Investigated

- CrashLoopBackOff
- ImagePullBackOff
- Pending Pods
- Failed Deployments
- Resource Constraints

---

### Monitoring & Reliability

- Metrics
- Logs
- Alerts
- Observability Concepts

---

## Real World SRE Workflow

```text
Alert
 ↓
Check Pod Status
 ↓
Check Logs
 ↓
Check Events
 ↓
Identify Root Cause
 ↓
Remediate
 ↓
Validate
```

---

## Learning Outcomes

Through this project I learned:

- Kubernetes Core Concepts
- AKS Administration
- Troubleshooting Techniques
- Monitoring & Observability
- Containerized Application Operations
- Reliability Engineering Fundamentals

---

## Future Enhancements

- Helm
- ArgoCD
- GitOps
- Kubernetes Security
- Auto-Remediation
- AI-Assisted Troubleshooting

---

## Author

Vishal Jagade

Microsoft Service Engineer | SRE | Automation Engineer | AI-SRE Journey
