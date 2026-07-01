# Kubernetes Learnings

## Pod

A Pod is the smallest deployable unit in Kubernetes. It wraps one or more containers.

## Deployment

A Deployment manages Pods and ReplicaSets. It provides:

- Replica management
- Self-healing
- Rolling updates
- Rollback

## Service

A Service provides stable networking access to Pods.

Types practiced:

- ClusterIP
- NodePort

## ConfigMap

ConfigMap stores non-sensitive configuration data such as:

- APP_ENV
- APP_MESSAGE

## Secret

Secret stores sensitive data such as:

- DB_USER
- DB_PASSWORD
- API keys
- Tokens

For practice, base64 encoded demo values were used. Real secrets should not be committed to GitHub.

## ReplicaSet

ReplicaSet maintains the desired number of Pods.

Example:

If desired replicas are 3 and one Pod is deleted, ReplicaSet automatically creates a new Pod.

## Rolling Update

Rolling Update gradually replaces old Pods with new Pods without downtime.

## Rollback

Rollback restores a Deployment to a previous stable revision.

## Liveness Probe

Checks if the application is alive. If liveness fails repeatedly, Kubernetes restarts the container.

## Readiness Probe

Checks if the application is ready to receive traffic. If readiness fails, Kubernetes removes the Pod from Service traffic.

## Namespace

Namespace provides logical isolation inside a Kubernetes cluster.

Examples:

- default
- dev
- test
- prod

## Key Takeaway

Kubernetes is not just about running containers. It is about managing application reliability, availability, networking, configuration, and self-healing.
