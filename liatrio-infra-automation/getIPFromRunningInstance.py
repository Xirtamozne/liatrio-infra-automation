#!/usr/bin/python

# Gets most recently launched public IP, still potential for data race

import json
import sys
import datetime
import calendar
format = '%Y-%m-%dT%H:%M:%S.000Z'

def getTimeStamp(datestring):
    #datestring = "2019-08-27T09:51:34.000Z"
    d = datetime.datetime.strptime(datestring, format)
    return calendar.timegm(d.timetuple())

def sortByTime(keyPosition):
   return keyPosition[1]

try:
   j = json.loads(open(sys.argv[1]).read())
except:
   print "Read Failure..."
   raise Exception

IPLaunchTimes=[]
for t in xrange(len(j['Reservations'])):
   if ("running" == j['Reservations'][t]['Instances'][0]['State']['Name']):
      if ("liatrio-jenkins-nexus" == j['Reservations'][t]['Instances'][0]['Tags'][0]['Value']):
         IPLaunchTimes.append( (j['Reservations'][t]['Instances'][0]['NetworkInterfaces'][0]['Association']['PublicIp'] , getTimeStamp(j['Reservations'][t]['Instances'][0]['LaunchTime'])))
         
IPLaunchTimes.sort(key=sortByTime)
print IPLaunchTimes[-1][0]
