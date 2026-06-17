# SDR-02: DAX / Dragon Copilot - Delay in Summary Delivery

## 1. Basic Details

**System:** Dragon Ambient eXperience (DAX) Copilot and Dragon Copilot  
**System Component:** US - Clinical draft delivery, including orchestration and processing services  
**Impact Level:** Multiple customers  
**Start Time:** 06/02/2026, 11:05 AM Eastern  
**Resolution Time:** 06/02/2026, 1:22 PM Eastern  
**Author:** Abhilash Paulson, Senior Service Engineering Manager, Microsoft Cloud for Healthcare

---

## 2. Customer Symptom

Users experienced delay in summary delivery for some encounters. Notes delivery took longer than expected to become available for some customer encounters.

---

## 3. Technical Summary / Root Cause

The disruption was caused by a temporary buildup of processing requests within the system, increasing wait times for summary delivery. The buildup was associated with delays in internal message processing and was amplified under higher load conditions, resulting in slower draft delivery workflow performance.

---

## 4. Remediation During Incident

```text
Engineering teams investigated latency across key processing components.
Source of delay was identified.
Additional processing capacity was introduced.
System queues were monitored until they returned to normal levels.
Performance checks confirmed service stabilized.
Draft generation times returned to expected levels.
```

---

## 5. Mid-term Improvements

```text
Continue monitoring and validation of system performance under varying load conditions.
Refine alerting signals to detect early signs of queue buildup or latency.
```

---

## 6. Root Cause Category

- [x] Queue buildup
- [x] Internal message processing delay
- [x] Load-related latency
- [x] Capacity scaling mitigation
- [x] Alert refinement opportunity

---

## 7. SRE Learning

- Queue buildup can cause customer-visible delay even without total outage.
- Capacity addition can be a mitigation when processing demand exceeds current throughput.
- Queue length and processing latency should be treated as core reliability indicators.
- Alert refinement is important for early detection.

---

## 8. If Same Issue Comes Again, My Action Plan

```text
Step 1: Confirm whether summary delivery is delayed or failed.
Step 2: Check queue length and processing latency.
Step 3: Identify which component is causing wait time.
Step 4: Check current load and compare against normal baseline.
Step 5: Add processing capacity if approved.
Step 6: Monitor queue drain and confirm draft generation time normalization.
Step 7: Add or refine alerting for early queue buildup detection.
```

---

## 9. Interview Story

```text
In a DAX/Dragon Copilot incident, users experienced delayed summary delivery for some encounters. Investigation found a temporary buildup of processing requests and internal message processing delays amplified by higher load. Engineering introduced additional processing capacity, monitored queues until normal, and confirmed draft generation times recovered. The key SRE learning was to monitor queue buildup and latency as early indicators before customer impact grows.
```
