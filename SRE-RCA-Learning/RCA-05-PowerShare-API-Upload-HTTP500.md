# RCA-05: PowerShare API Upload HTTP 500 Errors

## 1. Basic Details

**Incident No:** IcM 811546825  
**Product / Service:** PowerShare  
**Severity:** 2 / Critical  
**Customer Impacted:** Not specified in RCA customer field  
**Region / DC:** US  
**Start Time:** 12:32 AM EST 06/04/2026  
**End Time:** 10:42 AM EST 06/04/2026  
**Status:** Resolved / Remediated  
**RCA Author:** Naveen Sharma

---

## 2. Customer Symptom

Customer faced HTTP 500 errors during uploads through the PowerShare REST API via their application, PowerFoil.

---

## 3. Impact Analysis

- Customer experienced upload failures through REST API.
- Error type: HTTP 500.
- Application involved: PowerFoil.
- Monitoring alert was marked as No.
- Caused by change was Yes, linked to PSH-32718.
- Customer notification was sent at 10:45 AM EST 06/04/2026.

---

## 4. First Signal

Customer reported upload issue through the PowerShare API.

---

## 5. Timeline

```text
09:11 AM EST: Bridge started.
09:45 AM EST: Team joined call with customer to gather more issue details.
10:32 AM EST: Changes rolled back in stage environment.
10:42 AM EST: Changes rolled back in production environment.
10:45 AM EST: Customer notification sent.
```

---

## 6. Investigation Flow

```text
Customer reports API upload HTTP 500
↓
Bridge started
↓
Customer joined to provide details
↓
Recent security patch deployment reviewed
↓
Change PSH-32718 identified
↓
Rollback performed in stage
↓
Rollback performed in production
↓
Impact mitigated
```

---

## 7. Evidence Collected

- HTTP 500 errors occurred during PowerShare REST API uploads.
- Issue was caused by recent security patch deployment to Widgets/PowerShare API.
- Change PSH-32718 was rolled back in stage and production.
- Current update states impact was mitigated after rolling back the CR.

---

## 8. Root Cause Category

- [x] Deployment / patch regression
- [x] API failure
- [x] Change-related issue
- [x] Rollback mitigation
- [ ] Dependency failure
- [ ] Capacity issue
- [ ] Monitoring alert gap

---

## 9. Actual Root Cause

Recent security patch deployment to Widgets/PowerShare API caused upload failures through the PowerShare REST API.

---

## 10. Mitigation

Rolled back the changes deployed as part of PSH-32718 in stage and production.

---

## 11. Permanent Fix / Follow-up

Follow-ups were listed as N/A.

---

## 12. Prevention Plan

Suggested SRE prevention improvements:

- Add API upload smoke test after security patch deployment.
- Add canary rollout before production patch deployment.
- Add synthetic monitor for PowerShare REST API upload flow.
- Add automatic correlation between HTTP 500 spike and recent deployments.
- Maintain rollback checklist for API patch releases.

---

## 13. What I Learned as SRE

- HTTP 500 after a recent patch should immediately trigger change correlation.
- Rollback is often the fastest mitigation for patch-induced API failures.
- Stage rollback before production rollback can validate mitigation path.
- Customer-provided details can speed up reproduction and scoping.

---

## 14. If Same Issue Comes Again, My Action Plan

```text
Step 1: Confirm API endpoint and HTTP status code.
Step 2: Check whether error started after recent patch/change.
Step 3: Review monitoring/logs for HTTP 500 spike.
Step 4: Engage service owner and customer for reproduction details.
Step 5: Validate rollback in stage.
Step 6: Roll back production if approved.
Step 7: Notify customer and confirm upload recovery.
```

---

## 15. Interview Story

```text
In a PowerShare Sev2 incident, a customer reported HTTP 500 errors during REST API uploads through their application. The team correlated the failures with a recent security patch deployment to Widgets/PowerShare API. The mitigation was to roll back PSH-32718 first in stage and then in production, after which impact was mitigated. My learning was that recent change correlation and controlled rollback are key investigation techniques for API failures.
```
