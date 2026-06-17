# RCA-01: Nursing Prod - Intermittent Transcript Delivery Latency

## 1. Basic Details

**Incident No:** IcM 814424890  
**Product / Service:** Dragon Copilot (Nursing Service)  
**Severity:** 2 / Critical  
**Customer Impacted:** Multiple  
**Region / DC:** US  
**Start Time:** 09:27 AM EST 09/06/2026  
**End Time:** 12:50 PM EST 09/06/2026  
**Status:** Completed / Remediated  
**RCA Author:** Rizwan Sayyed

---

## 2. Customer Symptom

Nursing workflows experienced intermittent delays because transcript-ready notifications were delivered late.

---

## 3. Impact Analysis

- Multiple customers were impacted.
- Impact was narrowed to approximately 10-12 tenants.
- Four tenants had higher impacted sessions, each under 5% traffic.
- Monitoring alert was marked as No in the final synopsis.
- Internal notification was sent on 06/09/2026 at 12:58 PM EST.

---

## 4. First Signal

Bridge was started after Nursing Prod showed longer-than-expected transcript latency, suspected as a potential notification issue.

---

## 5. Timeline

```text
Bridge started.
Nursing Prod showed longer-than-expected transcript latency.
Impact refined to 10-12 tenants.
Four tenants showed higher impacted sessions, each under 5% traffic.
Azure Front Door regression was suspected but not confirmed.
Transcript readiness delays correlated to upstream Sev1 Event Grid latency, including failover.
Incident completed after mitigation.
```

---

## 6. Investigation Flow

```text
Transcript delivery delay observed
↓
Notification issue suspected
↓
Tenant impact refined
↓
Traffic impact percentage reviewed
↓
Azure Front Door regression considered
↓
Correlation found with upstream Event Grid latency and failover
```

---

## 7. Evidence Collected

- Delays occurred after notification publishing in Event Grid delivery path.
- Webhook response latency affected downstream transcript readiness notifications.
- Event Grid outage impacted receiving transcripts from DDE.
- 10-12 tenants were impacted.
- Four tenants had higher impacted sessions, each under 5% traffic.
- Azure Front Door regression was evaluated but not confirmed.

---

## 8. Root Cause Category

- [x] Dependency failure
- [x] Notification delivery latency
- [x] Event Grid issue
- [x] Webhook latency
- [ ] Application bug
- [ ] Capacity issue
- [ ] Monitoring gap

---

## 9. Actual Root Cause

Delays occurred after notification publishing in the Event Grid delivery path. Webhook response latency affected downstream transcript readiness notifications. The RCA also states an Event Grid outage caused issues receiving transcripts from DDE.

---

## 10. Mitigation

Traffic/failover behavior was adjusted across impacted regions to address delivery latency affecting notification flow.

---

## 11. Permanent Fix / Follow-up

The RCA listed follow-ups as N/A.

---

## 12. Prevention Plan

Suggested SRE prevention improvements:

- Add alerting for transcript-ready notification delivery latency.
- Track publish-to-receive latency by tenant and region.
- Add dashboard for Event Grid delivery delays and webhook response latency.
- Define dependency escalation path for Event Grid / DDE / Azure Front Door suspicion.
- Add synthetic probes that validate not only transcript generation but also notification receipt.

---

## 13. What I Learned as SRE

- Core service processing may be healthy while notification delivery is delayed.
- Tenant-level and traffic-percentage impact helps avoid overstatement.
- Dependency correlation is critical in modern distributed systems.
- Event Grid / webhook / DDE path should be treated as a separate failure domain.

---

## 14. If Same Issue Comes Again, My Action Plan

```text
Step 1: Confirm whether transcript generation is delayed or only transcript-ready notification is delayed.
Step 2: Compare publish timestamp and notification receive timestamp.
Step 3: Check tenant-wise and region-wise impact.
Step 4: Review Event Grid delivery latency, failover, webhook response patterns.
Step 5: Engage DDE/Event Grid/Azure Front Door teams with evidence.
Step 6: Track mitigation and validate recovery using tenant/session samples.
```

---

## 15. Interview Story

```text
In one Sev2 incident, Nursing workflows saw intermittent transcript delivery latency. The investigation showed that the issue was not simply transcript generation, but latency after notification publishing in the Event Grid delivery path. The team refined impact to a subset of tenants and correlated transcript readiness delays to upstream Event Grid latency, including failover. The mitigation adjusted traffic/failover behavior across impacted regions. My key learning was to separate core processing health from notification delivery health while investigating distributed systems.
```
