import requests
import time

url = "https://jsonplaceholder.typicode.com/posts"

for i in range(3):
    try:
        response = requests.get(url)

        if response.status_code == 200:
            data = response.json()

            for post in data[:2]:
                print("ID:", post["id"])
                print("Title:", post["title"])
                print("------")

            break
        else:
            print("Failed, retrying...")
            time.sleep(2 ** i)

    except Exception as e:
        print("Error:", e)

# ✅ Second API (users)
url2 = "https://jsonplaceholder.typicode.com/users"

response2 = requests.get(url2)

if response2.status_code == 200:
    users = response2.json()

    for user in users[:2]:
        print("Name:", user["name"])
        print("Email:", user["email"])
        print("------")

# ✅ Headers example
headers = {
    "Authorization": "Bearer dummy_token"
}

requests.get(url, headers=headers)
