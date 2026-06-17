# RCA Patterns Learned

## 1. Common Issue Categories So Far

| Category | Seen In | Pattern |
|---|---|---|
| Dependency failure | RCA-01, RCA-04 | Event Grid / Azure OpenAI dependency issue caused downstream service degradation. |
| Config issue | RCA-02, RCA-03 | Incorrect config or retry logic caused workflow failure. |
| Deployment / patch regression | RCA-05, RCA-06 | Recent patch or upgrade introduced customer-facing failure. |
| Region-specific issue | RCA-02, RCA-03, RCA-04 | Impact limited or more visible in specific regions. |
| Queue / load issue | SDR-02 | Internal request buildup caused delivery delay. |
| Monitoring / synthetic signal | RCA-03, RCA-04, RCA-06, SDR-02 | Monitoring or synthetic tests helped detect or should be improved. |

---

## 2. Common Investigation Patterns

### Pattern 1: Core Processing Healthy but Delivery/Notification Delayed

Seen in: RCA-01  

Signs:
- Transcript generation path may not be the primary issue.
- Delay occurs after notification publishing.
- Event Grid/webhook/DDE path is involved.

My Action:
```text
Compare publish timestamp vs receive timestamp.
Check Event Grid delivery latency.
Check webhook response latency.
Check tenant and region impact.
Engage dependency team with evidence.
```

---

### Pattern 2: Audio Available but Draft Not Generated

Seen in: RCA-02 and SDR-01

Signs:
- Audio exists.
- Draft generation stops after first recording.
- Recent rollout is correlated.
- Retry/backoff logic or session state may be involved.

My Action:
```text
Check audio availability.
Check first vs subsequent recording behavior.
Analyze logs for processing stop point.
Compare impacted and healthy regions.
Review recent rollout/config change.
Validate after config/pod restart.
```

---

### Pattern 3: Region-Specific Config Failure

Seen in: RCA-03

Signs:
- UK impacted but US/Canada not impacted.
- Recent config change exists.
- Payload/URL format misconfigured.

My Action:
```text
Compare config across regions.
Review recent CR.
Validate contract/payload format.
Correct or rollback config.
Run mobile upload synthetic test.
```

---

### Pattern 4: Upstream AI Dependency Outage

Seen in: RCA-04

Signs:
- Synthetic monitor failure.
- Multiple EU regions impacted.
- AOAI service returning 500.
- Retry-driven traffic amplifies issue.

My Action:
```text
Check synthetic monitors by region.
Check upstream Azure OpenAI health and related IcM.
Check retry traffic and queue indicators.
Engage platform/dependency teams.
Validate recovery using synthetics and metrics.
Reprocess missed work if required.
```

---

### Pattern 5: Patch / Deployment Regression

Seen in: RCA-05 and RCA-06

Signs:
- Issue starts after patch or CR.
- API errors or workflow errors appear.
- Rollback or corrective patch fixes issue.

My Action:
```text
Confirm affected version/change.
Check logs/errors and customer workflow.
Correlate start time with deployment.
Validate rollback or fix-forward path.
Communicate workaround and mitigation status.
```

---

### Pattern 6: Queue Buildup / Processing Latency

Seen in: SDR-02

Signs:
- Summary delivery delayed but not necessarily failed.
- Request backlog or message processing delay.
- Higher load amplifies latency.

My Action:
```text
Check queue length.
Check processing latency.
Check component throughput.
Add capacity if approved.
Monitor queue drain and latency recovery.
Refine alerts for queue buildup.
```

---

## 3. My Day 18 Incident Skills Covered

This RCA note project supports Day 18 learning:

- Incident lifecycle understanding
- Severity thinking
- Timeline building
- Triage flow
- Impact analysis
- Communication structure
- Evidence-based investigation
- Mitigation tracking
- Prevention mindset
- Interview storytelling

---

## 4. My SRE Improvements After Reviewing These RCAs

- Think in failure domains: core processing, notification, dependency, config, deployment, queue.
- Always ask: recent change? region-specific? dependency issue? monitoring gap?
- Do not stop at symptom; trace workflow step by step.
- Capture evidence clearly: counts, regions, timestamps, error codes, dashboard signals.
- For future prevention, think alerts, canary, rollback, runbook, synthetic tests, and capacity signals.
