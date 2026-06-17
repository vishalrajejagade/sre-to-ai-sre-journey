# RCA-06: PS One - Popup/Error Workflow Issues After Patch 6

## 1. Basic Details

**Incident No:** ICM 812268148  
**Product / Service:** PS One  
**Severity:** 2 / Critical  
**Customer Impacted:** Multiple  
**Region / DC:** US  
**Start Time:** 12:56 PM EST 06/05/2026  
**End Time:** 02:27 PM EST 06/09/2026  
**Status:** Resolved / Remediated  
**RCA Author:** Rahul Bhattacharjee

---

## 2. Customer Symptom

After PSO SP3 Patch 6 upgrade, multiple customers reported that when receiving an order update while an exam was open, the order update pop-up appeared multiple times, including about 50 stacked windows requiring multiple clicks to clear. Exceptions log showed Win32 Error.

---

## 3. Impact Analysis

- Multiple customers impacted.
- Workflow issue appeared after PSO SP3 Patch 6 upgrade.
- Monitoring alert was marked as Yes.
- Caused by change was Yes.
- Customer notification was No.
- Internal notification was sent at 03:10 PM ET 06/05/2026.

---

## 4. First Signal

Bridge started after multiple customers reported persistent popup/error workflow issues after PSO SP3 Patch 6 upgrade.

---

## 5. Timeline

```text
12:56 PM EST: Bridge started.
02:17 PM EST: Confirmed clickthrough nearly 50 times to clear stacked dialogs; no crash occurred.
02:21 PM EST: Order reverted to Scheduled status without order change message.
02:36 PM EST: Client log and exception log from testing/workaround uploaded to Azure blob sfgh04613919.
02:47 PM EST: Proposed communication to customer Lumus.
Mitigation focused on corrective patch 6A/6B.
```

---

## 6. Investigation Flow

```text
Multiple customers report popup/error workflow issue after Patch 6
↓
Bridge started
↓
User behavior reproduced / confirmed stacked dialog issue
↓
Order status behavior observed
↓
Client and exception logs collected
↓
Patch regression identified
↓
Corrective patch developed and released
```

---

## 7. Evidence Collected

- Issue occurred after PSO SP3 Patch 6 upgrade.
- Order update pop-up displayed repeatedly, around 50 stacked windows.
- Exceptions log showed Win32 Error.
- Order reverted to Scheduled status without order change message.
- Client log and exception log were uploaded for analysis.
- Root cause described backward-incompatible config/schema changes for some tenant setups and legacy data/state handling failure.

---

## 8. Root Cause Category

- [x] Patch regression
- [x] Backward compatibility issue
- [x] Legacy data/state handling issue
- [x] Application workflow bug
- [x] Customer configuration compatibility
- [ ] External dependency
- [ ] Capacity issue

---

## 9. Actual Root Cause

Patch 6 introduced a regression that caused incompatibility between updated services/components and existing customer configurations. Configuration or schema changes were not backward-compatible for some tenant setups, and a service component did not handle legacy data or state correctly.

---

## 10. Mitigation

A corrective patch was developed and released to customers. PSOne 2023.1 SP3 Patch 6A addressed the issue. The current update also references corrective patch 6A/6B.

---

## 11. Permanent Fix / Follow-up

The RCA listed follow-ups as N/A.

---

## 12. Prevention Plan

Suggested SRE prevention improvements:

- Add backward compatibility tests for customer configuration variations.
- Add legacy data/state validation before patch release.
- Expand upgrade test matrix for tenant setups.
- Add exception-log monitoring for Win32 error spikes after patch deployment.
- Add rollback/fix-forward decision criteria for customer upgrade incidents.
- Add customer communication template for patch regression symptoms.

---

## 13. What I Learned as SRE

- Patch regressions may not affect all customers equally because tenant configurations differ.
- Compatibility and legacy state must be part of release validation.
- Logs, screenshots, reproduction details, and customer workflow observations are critical for application incidents.
- Some mitigations require fix-forward patch releases rather than simple rollback.

---

## 14. If Same Issue Comes Again, My Action Plan

```text
Step 1: Confirm version/patch level for impacted customers.
Step 2: Capture exact user workflow and error behavior.
Step 3: Collect client logs and exception logs.
Step 4: Compare impacted vs non-impacted tenant configurations.
Step 5: Check recent patch release notes and known issues.
Step 6: Engage product/dev team for regression validation.
Step 7: Track corrective patch or rollback/fix-forward plan.
Step 8: Prepare customer communication with workaround and patch status.
```

---

## 15. Interview Story

```text
In a PS One Sev2 incident, multiple customers experienced repeated popup windows and workflow errors after a Patch 6 upgrade. Investigation confirmed the issue in user workflow, collected client and exception logs, and identified a patch regression involving backward compatibility with customer configurations and legacy data/state. The mitigation was a corrective patch release. My key learning was that upgrade incidents require patch-version correlation, compatibility validation, and customer-specific configuration analysis.
```
