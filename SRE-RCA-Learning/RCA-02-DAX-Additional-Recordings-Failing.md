# RCA-02: DAX Copilot - Additional Recordings Failing to Generate Drafts

## 1. Basic Details

**Incident No:** IcM 806470068  
**Product / Service:** DAX Copilot for Epic  
**Severity:** 2 / Critical  
**Customer Impacted:** Multiple  
**Region / DC:** US  
**Start Time:** 09:00 AM ET 27/05/2026  
**End Time:** 02:00 PM ET 27/05/2026  
**Status:** Completed / Remediated  
**RCA Author:** Vishal Jagade

---

## 2. Customer Symptom

Customers were unable to receive new draft documents from their recordings even though audio was available. Approximately 5,000 encounters were impacted.

---

## 3. Impact Analysis

- Multiple customers impacted.
- Approximately 5,000 encounters impacted.
- Audio was available, but draft documents were not generated for additional recordings.
- Monitoring alert was marked as No.
- SLA impact was marked as No.
- SDR/RCA was required.

---

## 4. First Signal

Bridge started and teams confirmed additional recordings were failing to generate new drafts even though audio was available.

---

## 5. Timeline

```text
01:08 PM ET: Bridge started.
01:12 PM ET: Additional recordings failing to generate new drafts despite audio availability.
01:19 PM ET: Team confirmed audio is available but drafts are not generated.
01:37 PM ET: Logs and behavior analyzed; processing stops after first recording.
01:52 PM ET: Issue correlated to recent rollout in US2 and US3 regions.
01:55 AM ET: Rollback plan executed.
01:58 AM ET: NLU pods restarted region by region in US2 and US3.
02:04 AM ET: Config map update applied to NLU service.
02:08 AM ET: Application pods restarted sequentially across both regions.
02:10 AM ET: System behavior validated after config and pod restarts.
02:12 AM ET: Impact end time recorded.
02:14 AM ET: Final synopsis agreed.
02:57 AM ET: Bridge down.
```

---

## 6. Investigation Flow

```text
Customer symptom: drafts not generated for additional recordings
↓
Audio availability confirmed
↓
Logs and behavior analyzed
↓
Processing found to stop after first recording
↓
Issue correlated with rollout in US2/US3
↓
Rollback/config mitigation planned
↓
NLU pods restarted region by region
↓
New recordings validated successfully
```

---

## 7. Evidence Collected

- Audio was available but drafts were not generated.
- Logs and behavior showed processing stopped after first recording.
- Issue correlated to recent rollout in US2 and US3.
- Workaround identified: regeneration clears session state and allows processing.
- Config fix applied in impacted regions.
- New recordings processed normally after mitigation.
- Cleanup/reprocessing of impacted sessions was in progress.

---

## 8. Root Cause Category

- [x] Application workflow issue
- [x] Rollout correlation
- [x] Config / retry logic issue
- [x] Kubernetes / pod restart mitigation
- [ ] External dependency
- [ ] Capacity issue
- [ ] Monitoring gap

---

## 9. Actual Root Cause

Drafts for subsequent recordings were not generated in specific rare circumstances. Processing stopped after the first recording, and the issue was correlated with a recent rollout in impacted US2 and US3 regions.

---

## 10. Mitigation

- Disabled fire bundle / backoff retry logic as temporary mitigation.
- Applied config map update to NLU service.
- Restarted NLU/application pods sequentially across US2 and US3.
- Verified drafts generated properly for new recordings.

---

## 11. Permanent Fix / Follow-up

The RCA mentions cleanup and repair/reprocessing of impacted sessions. No detailed future action item was listed in the action item table.

---

## 12. Prevention Plan

Suggested SRE prevention improvements:

- Add rollout guardrails for US2/US3 region changes.
- Add validation test for multi-recording/session draft generation.
- Add alert for audio available but draft not generated within expected SLA.
- Track first recording vs subsequent recording processing success.
- Add canary validation before full regional rollout.
- Add documented runbook for disabling retry logic safely.

---

## 13. What I Learned as SRE

- Audio availability does not guarantee draft generation success.
- Session-state behavior can cause failures only after the first recording.
- Recent rollout correlation is a powerful investigation path.
- Region-by-region restart and validation reduces blast radius.

---

## 14. If Same Issue Comes Again, My Action Plan

```text
Step 1: Confirm whether audio exists for impacted encounters.
Step 2: Check whether first recording works but subsequent recordings fail.
Step 3: Query logs for draft-generation stop point.
Step 4: Compare impacted vs healthy regions.
Step 5: Check recent rollouts/config changes in impacted regions.
Step 6: Engage NLU/service owner for retry/config validation.
Step 7: If approved, apply rollback/config change and restart pods region by region.
Step 8: Validate new recordings and start cleanup/reprocessing.
```

---

## 15. Interview Story

```text
In a Sev2 DAX Copilot incident, additional recordings were failing to generate drafts even though audio was available. The team confirmed audio presence and used logs to identify that processing stopped after the first recording. The issue was correlated with a recent rollout in US2/US3. Mitigation included disabling the affected retry logic through config change, restarting NLU pods region by region, and validating that new recordings generated drafts successfully. The key learning was to narrow the issue by workflow stage and correlate symptoms with recent regional changes.
```
