#!/usr/bin/env python

import requests
import time

def checkEndpoint(targetURL, port):
   try:
      retcode = requests.get(targetURL + ':' + port).status_code
   except:
      print targetURL + " is not reachable on port: " + port + "... "
      print "Retrying in a few seconds..."
      time.sleep(5)
      checkEndpoint(targetURL, port)
   return (retcode == 200)

reqIP = ""
try:
   reqIP = open('.instanceip','r').read().strip()
except:
   print "Deployment process not followed... instance IP not discovered."
   raise

reqURL = 'http://' + reqIP

nexusPort = '8081'
jenkinsPort = '8080'

if checkEndpoint(reqURL, jenkinsPort):
   print "Jenkins is up!"
else:
   print "Jenkins not responding on " + jenkinsPort + "."

if checkEndpoint(reqURL, nexusPort):
   print "Nexus is up!"
else:
   print "Nexus not responding on " + nexusPort + "."

