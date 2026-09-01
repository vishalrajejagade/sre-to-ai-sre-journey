# Nginx Service Recovery Runbook v2

## Purpose

Recover Nginx service safely and restore application availability.

## Owner

SRE Team

## Inputs

- Incident ID
- Hostname
- Service Status
- Business Impact

## Detection

Check service status:

```bash
systemctl is-active nginx