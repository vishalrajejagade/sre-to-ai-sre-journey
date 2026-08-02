# Day 44 - OpenTelemetry & Distributed Tracing

## What is Distributed Tracing?

Tracking a request as it travels across multiple services.

Example:

Frontend
↓
Checkout
↓
Payment
↓
Database

## Trace

Complete request journey.

## Span

Single step inside a trace.

## Trace ID

Unique identifier for an entire request.

## Span ID

Unique identifier for one operation.

## OpenTelemetry

Collects:

- Metrics
- Logs
- Traces

## Jaeger

Used for distributed tracing visualization.

## Key Learning

Tracing helps identify bottlenecks and failures across microservices.