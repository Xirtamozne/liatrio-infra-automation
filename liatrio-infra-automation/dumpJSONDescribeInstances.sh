aws ec2 describe-instances > instances.json
export TARGETIP=`python getIPFromRunningInstance.py instances.json`
sed "s#TGTHOST#$TARGETIP#g" jenkinsHostTemplate > ./ansible-playbooks/inventory/template-env/hosts
echo $TARGETIP > .instanceip
