import json

with open("sample-ai-output.json") as f:
    ai_output = json.load(f)

with open("evidence.json") as f:
    evidence = json.load(f)

support = False

if "connection refused" in evidence["logs"]:
    support = True

print("\n===== VALIDATION RESULT =====")

print("Recommendation:",
      ai_output["recommendation"])

print("Confidence:",
      ai_output["confidence"])

print("Risk:",
      ai_output["risk"])

if support:
    print("Decision: APPROVED")
else:
    print("Decision: MORE EVIDENCE REQUIRED")