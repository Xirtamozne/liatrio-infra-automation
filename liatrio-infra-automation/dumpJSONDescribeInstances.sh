aws ec2 describe-instances > instances.json
export TARGETIP=`python getIPFromRunningInstance.py instances.json | tail -1`
sed "s#TGTHOST#$TARGETIP#g" jenkinsHostTemplate > ./ansible-playbooks/inventory/template-env/hosts
sed "s#TGTHOST#$TARGETIP#g" .instanceip.template > .instanceip.yml
echo $TARGETIP > .instanceip
sleep 3
scp -i ~/.ssh/LiatrioKeyPairFinal.pem ./postInstall.sh ubuntu@$TARGETIP:/home/ubuntu/
sleep 3
scp -i ~/.ssh/LiatrioKeyPairFinal.pem ./postInstall.sh ubuntu@$TARGETIP:/home/ubuntu/
sleep 3
ssh -ttqi ~/.ssh/LiatrioKeyPairFinal.pem ubuntu@$TARGETIP "sudo -H /home/ubuntu/postInstall.sh"
