# Day 42 - Prometheus

## What is Prometheus?

Prometheus is an open-source monitoring and alerting system.

## Components

- Prometheus Server
- Exporters
- PromQL
- Alertmanager

## Architecture

Application
↓
Exporter
↓
Prometheus
↓
Grafana

## PromQL Examples

CPU Usage:

node_cpu_seconds_total

Memory:

node_memory_MemAvailable_bytes

## Benefits

- Time-series database
- Pull-based monitoring
- Kubernetes friendly