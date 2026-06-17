# RCA-04: UK Browser UX Synthetic Test / Cloud Monitor Failure

## 1. Basic Details

**Incident No:** IcM 807841660  
**Product / Service:** Dragon Copilot  
**Severity:** 2 / Critical  
**Customer Impacted:** Multiple  
**Region / DC:** UK / EU impact mentioned across UK, Germany, and France  
**Start Time:** 10:59 AM ET 05/29/2026  
**End Time:** 02:49 PM ET 05/29/2026  
**Status:** Mitigated / Remediated  
**RCA Author:** Gaurang Umredkar

---

## 2. Customer Symptom

Synthetic monitoring reported failures on the Dragon Copilot browser recording path. UK, Germany, and France faced consistent synthetic failures causing delayed or failed note/report delivery.

---

## 3. Impact Analysis

- Multiple customers impacted.
- UK, Germany, and France were impacted.
- Synthetic tests failed.
- Delayed or failed note/report delivery observed.
- Azure OpenAI availability issues existed across multiple European regions.
- Residual impact in UK South was monitored separately.

---

## 4. First Signal

Cloud Monitor / synthetic monitoring detected failure for Browser-UX 1P_UK_Recording_test.

---

## 5. Timeline

```text
11:28 AM ET: Bridge started.
11:43 AM ET: Executive bridge scheduled.
11:56 AM ET: NLU errors observed across UK South, UK West, France Central, Germany West Central.
12:06 PM ET: DE test showed report generation took 4-5 minutes.
12:18 PM ET: UK customer Calderdale reported delay in creating reports.
12:20 PM ET: AOAI EUS2 returning 500.
12:25 PM ET: Potential upstream IcM 807679381 being investigated as causal.
12:50 PM ET: Potential root cause noted as substantial traffic increase to GPT-5.3 from Office caused by retry logic.
01:05 PM ET: Recovery seen across EU regions.
01:18 PM ET: Synthetics green again and metrics normalized across DE, FR and UK stamps.
01:19 PM ET: All region synthetics passing.
01:21 PM ET: No-draft-delivered counts recorded for UK1, DE1, FR1.
01:25 PM ET: DE test report creation immediate and prompts working.
01:30 PM ET: Main bridge declared mitigated for all regions except UK South.
02:34 PM ET: Tail of failures in UK South still under investigation.
02:49 PM ET: Encounters with no drafts delivered were reprocessed.
02:49 PM ET: Bridge down.
```

---

## 6. Investigation Flow

```text
Synthetic monitor failure
↓
Browser recording path investigated
↓
NLU/report delivery errors checked across EU regions
↓
Customer report confirmed delay
↓
AOAI 500s observed
↓
Upstream IcM 807679381 correlated
↓
Azure OpenAI availability issue identified
↓
Retry-driven traffic and platform controls reviewed
↓
Synthetics and metrics monitored for recovery
↓
Missed workloads reprocessed using Geneva actions
```

---

## 7. Evidence Collected

- Synthetic tests failed for Browser-UX 1P_UK_Recording_test.
- NLU errors observed across UK South, UK West, France Central, and Germany West Central.
- Customer reported report-generation delays.
- AOAI EUS2 returned 500.
- Upstream Azure OpenAI availability issue was identified across European regions.
- Excessive retry-driven traffic impacted AI services.
- Synthetic monitors turned green and metrics normalized.
- Failed/delayed workloads were reprocessed using Geneva actions.

---

## 8. Root Cause Category

- [x] External dependency / upstream platform availability
- [x] Azure OpenAI availability issue
- [x] Retry-driven traffic amplification
- [x] Synthetic monitoring detection
- [x] Reprocessing / recovery action
- [ ] Application config issue
- [ ] Customer-side issue

---

## 9. Actual Root Cause

The RCA states the outage was caused by upstream Azure OpenAI availability issues across multiple European regions, with excessive retry-driven traffic impacting AI services across regions.

---

## 10. Mitigation

- Platform-side controls were applied to stabilize excessive retry-driven traffic.
- Failed and delayed workloads were reprocessed using Geneva actions.
- Service health was validated through synthetic test recovery and normalized metrics.
- UK South residual impact was monitored separately.

---

## 11. Permanent Fix / Follow-up

Follow-ups were listed as N/A. UK South residual impact was monitored separately during the event.

---

## 12. Prevention Plan

Suggested SRE prevention improvements:

- Add dependency-aware alerts for Azure OpenAI regional availability.
- Add retry budget / backoff controls to reduce amplification during upstream degradation.
- Build dashboards for synthetic status by region.
- Alert when report generation latency exceeds threshold across synthetic and real traffic.
- Define runbook for Geneva reprocessing actions.
- Track no-draft-delivered counts by region and organization.

---

## 13. What I Learned as SRE

- Synthetic monitors can detect user-impacting workflow failures early.
- Upstream AI service degradation can appear as downstream note/report delay.
- Retry logic can amplify platform incidents.
- Recovery validation should include synthetic monitors, metrics, and reprocessing confirmation.

---

## 14. If Same Issue Comes Again, My Action Plan

```text
Step 1: Check synthetic monitor failure and affected workflow.
Step 2: Confirm customer impact and affected regions.
Step 3: Check AOAI/Azure OpenAI dependency health and related upstream IcMs.
Step 4: Review NLU/report generation errors by region.
Step 5: Check retry traffic and queue/backlog indicators.
Step 6: Engage platform/dependency teams.
Step 7: Validate recovery through synthetics and normalized metrics.
Step 8: Reprocess missed workloads if required.
```

---

## 15. Interview Story

```text
In a Sev2 Dragon Copilot incident, synthetic monitoring detected failures on the browser recording path and multiple European regions saw delayed or failed report delivery. Investigation found upstream Azure OpenAI availability issues and retry-driven traffic amplification. Platform-side controls stabilized the traffic, synthetic monitors turned green, and missed workloads were reprocessed using Geneva actions. My learning was that synthetic monitoring, regional correlation, and dependency health checks are critical for AI-powered services.
```
