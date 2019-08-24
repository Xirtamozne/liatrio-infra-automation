#!/bin/bash
#From: https://github.com/sonatype-nexus-community/nexus-scripting-examples/blob/master/simple-shell-example/create.sh

jsonFile=$1

printf "Creating Integration API Script from $jsonFile\n\n"

curl -v -u admin:admin123 --header "Content-Type: application/json" 'http://54.210.200.131:8081/service/rest/v1/script/' -d @$jsonFile
