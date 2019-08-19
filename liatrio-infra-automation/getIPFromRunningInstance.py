#!/usr/bin/python

## Quick and dirty code-snippet to grab the external IP from the actively running instance with the appropriate tag.

import json
import sys

try:
   j = json.loads(open(sys.argv[1]).read())
except:
   print "Read Failure..."
   raise Exception

for t in xrange(len(j['Reservations'])):
   if ("running" == j['Reservations'][t]['Instances'][0]['State']['Name']):
      if ("liatrio-jenkins-nexus" == j['Reservations'][t]['Instances'][0]['Tags'][0]['Value']):
         print j['Reservations'][t]['Instances'][0]['NetworkInterfaces'][0]['Association']['PublicIp']
