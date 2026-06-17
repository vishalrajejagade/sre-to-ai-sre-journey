# SDR-01: DAX Copilot - Additional Recordings Failing to Generate Drafts

## 1. Basic Details

**Incident:** IcM 806470068  
**System:** DAX Copilot  
**System Component:** Draft Generation and Natural Language Understanding (NLU) Processing Services  
**Impact Level:** Multiple  
**Start Time:** 05/27/2026 at 09:00 AM ET  
**Resolution Time:** 05/27/2026 at 02:00 PM ET  
**Author:** Jibin Jacob, Senior Service Engineering Manager, Health & Life Sciences Solutions and Platforms

---

## 2. Customer Symptom

A subset of DAX Copilot customers in the US datacenter experienced a disruption where recordings were captured and audio was available, but draft clinical documentation was not generated for certain encounters.

---

## 3. Impact Analysis

- Subset of DAX Copilot customers in US datacenter impacted.
- Approximately 5,000 encounters impacted.
- Customers may have experienced delays or failures receiving draft documentation from completed recordings.

---

## 4. Technical Summary / Root Cause

A rare processing condition within the draft generation workflow prevented subsequent recordings in a session from being processed correctly. Audio recordings were successfully captured and available, but draft generation stopped after the initial recording under specific circumstances. The issue was correlated with a recent service rollout in affected regions.

---

## 5. Remediation During Incident

```text
Engineering teams analyzed service logs and processing behavior.
Issue correlated to recent rollout affecting impacted regions.
Rollback and mitigation strategy executed.
Backoff retry logic for affected workflow disabled via configuration update.
NLU service pods restarted region by region.
Configuration updates applied and validated.
New recordings verified successfully generating draft documentation.
Cleanup and reprocessing initiated for impacted encounters where possible.
```

---

## 6. SRE Learning

- SDR language is more customer-facing and concise than RCA language.
- It clearly separates incident summary, technical root cause, and remediation.
- The SDR reinforces the same learning from RCA-02: audio available does not mean draft generation succeeded.
- Recent rollout correlation plus controlled pod restart was key.

---

## 7. Interview Story

```text
In a DAX Copilot service disruption, customers had recordings with audio available but draft documentation was not generated for some encounters. Engineering analyzed logs and found the issue in the draft generation workflow, correlated it to a recent rollout, disabled affected backoff retry logic via config, restarted NLU pods region by region, and validated new draft generation. This incident taught me the importance of isolating workflow stage failures and validating recovery with new traffic.
```
