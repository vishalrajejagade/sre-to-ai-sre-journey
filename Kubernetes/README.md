# Day 28 - Kubernetes ReplicaSet, Rolling Updates, Probes and Namespaces

## Topics Covered

- ReplicaSet
- Self-healing
- Rolling Update
- Rollback
- Liveness Probe
- Readiness Probe
- Namespace

## Practical Completed

- Created ReplicaSet with 3 replicas
- Deleted one Pod and observed self-healing
- Performed rolling update on Deployment
- Performed rollback on Deployment
- Added liveness and readiness probes
- Created `dev` namespace
- Deployed application inside `dev` namespace

## Files

- `replicaset.yaml`
- `deployment.yaml`
- `namespace.yaml`
- `COMMANDS.md`
- `LEARNINGS.md`

## Key Learnings

- ReplicaSet maintains the desired number of Pods.
- Deployment manages ReplicaSets and supports rolling updates and rollback.
- Liveness probe checks whether the application is alive.
- Readiness probe checks whether the application is ready to receive traffic.
- Namespace provides logical isolation inside a Kubernetes cluster.
