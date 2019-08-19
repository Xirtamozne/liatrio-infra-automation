#!/usr/bin/env python

import json
import subprocess

class AWSCreds:
   def __init__(self):
      self.mycreds = json.loads(subprocess.check_output(["aws", "sts", "get-session-token"]))

   def getAccessKeyId(self):
      return str(self.mycreds['Credentials']['AccessKeyId'])

   def getSecretAccessKey(self):
      return str(self.mycreds['Credentials']['SecretAccessKey'])

   def replaceTemplate(self, filename, replaceAccessKeyId='AWSACCESSKEY', replaceSecretAccessKey='AWSSECRETKEY'):
      template = open(filename + ".template").read()
      outFile = template.replace(replaceAccessKeyId, self.getAccessKeyId()).replace(replaceSecretAccessKey, self.getSecretAccessKey())
      f = open(filename, 'w')
      f.write(outFile)
