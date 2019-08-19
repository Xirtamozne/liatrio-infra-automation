export TARGETIP=`aws ec2 describe-instances | grep PublicIpAddress | tail -1 | awk -F\" '{print $4}'`
sed "s#TGTHOST#$TARGETIP#g" jenkinsHostTemplate > ./ansible-playbooks/inventory/template-env/hosts
