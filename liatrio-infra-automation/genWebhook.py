#!/usr/bin/python
import json
import requests

url="https://github.com/Xirtamozne/spring-petclinic/settings/hooks"
payload=json.loads(open('makeHook.json').read().replace('INSTANCEIP',open('.instanceip').read().strip()))
r = requests.post(url, data=payload)
print url
print payload
print "=============================="
print r.text
print r.status_code
