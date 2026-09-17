import requests

def ask_qwen(prompt):

    response = requests.post(
        "http://localhost:11434/api/generate",
        json={
            "model": "qwen3",
            "prompt": prompt,
            "stream": False
        }
    )

    return response.json()["response"]

incident = """
Users receive HTTP 502 Bad Gateway.

Create 5 investigation steps.
"""

print(ask_qwen(incident))