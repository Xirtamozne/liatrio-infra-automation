#!/usr/bin/env python

#Implements AWSCreds... pass in file to transpose as first arument.
#File must have an associated immutable fname.template structure
# The argument would be the output file of form liatrio-ec2.tf
# The existing template would be of form liatrio-ec2.tf.template

import sys
from AWSCreds import AWSCreds
AWS = AWSCreds()
AWS.replaceTemplate(sys.argv[1])
