import json

with open("alerts.json") as f:
    alerts = json.load(f)

root_cause = None
symptoms = []

for alert in alerts:

    if "Down" in alert["message"]:
        root_cause = alert["message"]

    else:
        symptoms.append(alert["message"])

print("===== INCIDENT =====")
print("Root Cause Candidate:", root_cause)

print("\nSymptoms:")

for symptom in symptoms:
    print("-", symptom)