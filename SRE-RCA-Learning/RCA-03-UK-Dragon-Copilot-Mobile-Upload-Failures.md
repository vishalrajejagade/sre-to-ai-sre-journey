# RCA-03: UK Dragon Copilot - Mobile Upload Failures

## 1. Basic Details

**Incident No:** IcM 813806035  
**Product / Service:** Dragon Copilot  
**Severity:** 2 / Critical  
**Customer Impacted:** Multiple  
**Region / DC:** UK  
**Start Time:** 06/08/2026 2:30 AM EST  
**End Time:** 06/08/2026 2:30 PM EST  
**Status:** Completed / Remediated  
**RCA Author:** Rizwan Sayyed

---

## 2. Customer Symptom

Customers were unable to complete upload operations in Dragon Copilot mobile workflows.

---

## 3. Impact Analysis

- Multiple customers impacted.
- Impact was limited to the UK region.
- No US/Canada impact was identified.
- Monitoring alert was marked as Yes.
- Caused by change was Yes, linked to CR2829082.

---

## 4. First Signal

Customer impact was confirmed and the incident was upgraded to Sev2.

---

## 5. Timeline

```text
Customer impact confirmed and incident upgraded to Sev2.
Initial investigation suspected Cosmos DB access / RBAC layer.
Team identified issue was limited to UK region only.
No US/Canada impact was found.
Issue identified as incorrect UK config update CR2829082.
Streaming URL / payload format was misconfigured.
Corrected Cosmos DB configuration/payload.
Bridge completed.
```

---

## 6. Investigation Flow

```text
Mobile upload failures reported
↓
Customer impact confirmed
↓
Initial suspicion: Cosmos DB access / RBAC layer
↓
Region isolation: UK only
↓
No US/Canada impact
↓
Recent change CR2829082 reviewed
↓
Incorrect UK config / streaming URL / payload found
↓
Cosmos DB config/payload corrected
```

---

## 7. Evidence Collected

- Upload operations failed in Dragon Copilot mobile workflows.
- Initial suspicion was Cosmos DB access / RBAC layer.
- Issue was limited to UK region.
- Incorrect UK config update CR2829082 caused streaming URL/payload format misconfiguration.
- Correcting Cosmos DB configuration/payload mitigated the issue.

---

## 8. Root Cause Category

- [x] Configuration issue
- [x] Change-related issue
- [x] Region-specific issue
- [x] Payload / contract nuance missed
- [ ] External dependency
- [ ] Capacity issue
- [ ] Monitoring gap

---

## 9. Actual Root Cause

A UK configuration update likely missed contract-type nuances and applied an incorrect payload. The RCA identifies CR2829082 as the related change, with streaming URL/payload format misconfiguration causing mobile upload failures.

---

## 10. Mitigation

Corrected Cosmos DB configuration/payload.

---

## 11. Permanent Fix / Follow-up

No explicit follow-up was listed in the RCA.

---

## 12. Prevention Plan

Suggested SRE prevention improvements:

- Add pre-deployment validation for region-specific payloads.
- Add contract-type regression test for mobile workflows.
- Add config diff review for UK vs US/Canada.
- Add automated upload synthetic tests for mobile workflows.
- Add rollback plan for Cosmos DB config changes.
- Include RBAC/access validation in triage checklist but confirm with config comparison.

---

## 13. What I Learned as SRE

- Region-specific config changes can break only one geography.
- Initial suspicion may be RBAC/access, but region comparison and change review can reveal config root cause.
- Payload and contract nuances matter in service configuration.

---

## 14. If Same Issue Comes Again, My Action Plan

```text
Step 1: Confirm upload failure type and impacted workflow.
Step 2: Check region scope: UK vs US vs Canada.
Step 3: Review monitoring alert and recent changes.
Step 4: Validate Cosmos DB access/RBAC suspicion.
Step 5: Compare payload/streaming URL config with known-good regions.
Step 6: Correct config or rollback CR if needed.
Step 7: Validate upload workflow with synthetic/mobile test.
```

---

## 15. Interview Story

```text
In one Sev2 Dragon Copilot incident, multiple UK customers could not complete mobile uploads. Initial investigation suspected Cosmos DB access or RBAC, but regional comparison showed the issue was limited to UK with no US/Canada impact. The team correlated the issue to CR2829082 and found an incorrect UK config/payload format. Correcting the Cosmos DB configuration resolved the issue. My learning was to combine RBAC checks with region-based comparison and recent change review before concluding root cause.
```
