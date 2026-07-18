# SPOF Review

## nginx-ha

Replicas: 3

Risk:
Low

Reason:
Multiple replicas provide redundancy.

---

## Single Replica Application

Risk:
High

Reason:
Pod failure can cause outage.

Improvement:
Use at least 3 replicas.