# Day 34 - StatefulSets, Persistent Volumes and Persistent Volume Claims

## Topics Covered

- Stateless vs Stateful Applications
- Persistent Volumes (PV)
- Persistent Volume Claims (PVC)
- Storage Classes
- Dynamic Provisioning
- Azure Disk Storage
- StatefulSets
- Headless Services
- Backup and Restore Basics

---

## Lab 1 - Storage Classes

```bash
kubectl get storageclass
```

Learned:

- StorageClass automatically provisions storage.
- AKS uses Azure Disk CSI driver.

---

## Lab 2 - PersistentVolumeClaim

Created:

```yaml
nginx-pvc
```

Verified:

```bash
kubectl get pvc
```

Status:

```text
Bound
```

---

## Lab 3 - Deployment using PVC

Created:

```yaml
deployment-pvc.yaml
```

Mounted storage to:

```text
/usr/share/nginx/html
```

---

## Lab 4 - Persistence Test

Created file:

```bash
echo "Hello Vishal" > index.html
```

Deleted Pod:

```bash
kubectl delete pod <pod-name>
```

New Pod recreated automatically.

Verified:

```bash
cat index.html
```

Output:

```text
Hello Vishal
```

Result:

✅ Data survived Pod deletion.

---

## Lab 5 - Headless Service

Created:

```yaml
nginx-headless
```

Verified:

```bash
kubectl get svc
```

Output:

```text
CLUSTER-IP = None
```

---

## Lab 6 - StatefulSet

Created:

```yaml
statefulset.yaml
```

Observed Stable Pod Names:

```text
nginx-0
nginx-1
```

---

## Lab 7 - Scaling StatefulSet

Scale Up:

```bash
kubectl scale statefulset nginx --replicas=3
```

Result:

```text
nginx-0
nginx-1
nginx-2
```

Scale Down:

```bash
kubectl scale statefulset nginx --replicas=1
```

Result:

```text
nginx-2 deleted
nginx-1 deleted
nginx-0 remained
```

---

## Key Learnings

### Persistent Volume (PV)

Storage resource inside Kubernetes.

### Persistent Volume Claim (PVC)

Storage request by applications.

### StatefulSet

Provides:

- Stable Pod names
- Stable identities
- Ordered scaling
- Ordered termination

### Headless Service

Provides direct DNS identity for StatefulSet Pods.

### Dynamic Provisioning

PVC automatically created Azure Disk using StorageClass.

---

## Architecture

Application
│
▼
Deployment / StatefulSet
│
▼
PVC
│
▼
PV
│
▼
Azure Disk

---

## Validation

```bash
kubectl get storageclass
kubectl get pv
kubectl get pvc
kubectl get statefulset
kubectl get svc
kubectl get pods
```

---

## Outcome

- Created PVC
- Created PV automatically
- Verified Azure Disk provisioning
- Verified persistent data survives Pod deletion
- Created StatefulSet
- Created Headless Service
- Verified stable Pod identities