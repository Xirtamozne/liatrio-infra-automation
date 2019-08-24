#!/usr/bin/python
import json
import requests

url="https://github.com/Xirtamozne/spring-petclinic/settings/hooks"
headers = {'Authorization': 'token 0d2988372af1d0b605e41ab4db89d61514527ce2'}
payload=json.loads(open('makeHook.json').read().replace('INSTANCEIP',open('.instanceip').read().strip()))
r = requests.post(url, headers=headers, data=payload)
print url
print payload
print "=============================="
print r.text
print r.status_code
