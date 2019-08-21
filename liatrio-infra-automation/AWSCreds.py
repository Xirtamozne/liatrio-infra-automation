#!/usr/bin/env python

import json
import subprocess

class AWSCreds:
   def __init__(self):
      self.mycreds = json.loads(subprocess.check_output(["aws", "sts", "get-session-token"]))
      self.myowner = json.loads(subprocess.check_output(["aws", "iam", "get-user"]))

   def getAccessKeyId(self):
      return str(self.mycreds['Credentials']['AccessKeyId'])

   def getSecretAccessKey(self):
      return str(self.mycreds['Credentials']['SecretAccessKey'])

   def getAMIOwner(self):
      return str(self.myowner['User']['Arn']).split(':')[4]

   def replaceTemplate(self, filename, replaceAMIOwner='AMIOWNER', replaceAccessKeyId='AWSACCESSKEY', replaceSecretAccessKey='AWSSECRETKEY'):
      template = open(filename + ".template").read()
      outFile = template.replace(replaceAMIOwner, self.getAMIOwner()).replace(replaceAccessKeyId, self.getAccessKeyId()).replace(replaceSecretAccessKey, self.getSecretAccessKey())
      f = open(filename, 'w')
      f.write(outFile)
