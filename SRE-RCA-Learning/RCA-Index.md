# RCA Learning Index

| No | Incident / Issue | Product | Region | Severity | Root Cause Type | Main Learning |
|---|---|---|---|---|---|---|
| RCA-01 | Nursing Prod intermittent transcript delivery latency | Dragon Copilot Nursing | US | Sev2 | Dependency / Event Grid / Webhook latency | Core workflow can be healthy while notification delivery is delayed. |
| RCA-02 | Additional recordings failing to generate drafts | DAX Copilot for Epic | US | Sev2 | Application workflow + rollout/config | Logs and behavior showed processing stopped after first recording; mitigation used config change and NLU pod restart. |
| RCA-03 | UK mobile upload failures | Dragon Copilot | UK | Sev2 | Configuration / Cosmos DB payload / change-related | Region-specific config update can break workflow; compare impacted vs non-impacted regions. |
| RCA-04 | Synthetic test failure / delayed report delivery | Dragon Copilot | EU / UK, Germany, France | Sev2 | Upstream Azure OpenAI dependency / retry-driven traffic | Synthetic monitors help detect impact; dependency outage can impact downstream AI services. |
| RCA-05 | PowerShare API upload HTTP 500 errors | PowerShare | US | Sev2 | Security patch deployment regression | Recent change correlation and rollback can quickly mitigate customer-facing API failures. |
| RCA-06 | PS One persistent popup/error workflow after Patch 6 upgrade | PS One | US | Sev2 | Patch regression / backward compatibility / legacy state | Upgrade compatibility and legacy data handling must be validated before rollout. |
| SDR-01 | DAX Copilot additional recordings failing | DAX Copilot | US | Multiple impact | Rare draft generation workflow condition | SDR version gives customer-facing technical summary and remediation wording. |
| SDR-02 | Delay in summary delivery | DAX Copilot and Dragon Copilot | US | Multiple customers | Queue buildup / internal message processing latency / load | Queue latency and capacity are important reliability signals. |
