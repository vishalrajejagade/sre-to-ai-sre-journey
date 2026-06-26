# Day 18 - Safe Deployment Automation

## Objective
Build a safe deployment script using SRE principles.

## Concepts Covered
- Idempotency
- Dry Run
- Rollback
- Logging
- Health Checks
- Retry Mechanism

## Flow
Check → Backup → Deploy → Health Check → Success/Failure → Rollback

## Interview Questions

Q1: Why idempotency?
Safe repeated execution.

Q2: Why Dry Run?
Preview changes without risk.

Q3: Why rollback?
Quick recovery.

Q4: Why limit retries?
Avoid overload.

Q5: If rollback fails?
Raise alert + manual intervention.

## Learning
Safe automation prevents production outages.