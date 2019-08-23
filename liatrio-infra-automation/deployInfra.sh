./bootstrap-packer.sh
sleep 5
./bootstrap-terraform.sh
sleep 5
./dumpJSONDescribeInstances.sh
sleep 5
scp -i ~/.ssh/LiatrioKeyPairFinal.pem ./postInstall.sh ubuntu@`cat .instanceip`:/home/ubuntu/
sleep 5
ssh -ttqi ~/.ssh/LiatrioKeyPairFinal.pem ubuntu@`cat .instanceip` "sudo /home/ubuntu/postInstall.sh"
sleep 5
./bootstrap-jenkins.sh
sleep 5
./bootstrap-nexus.sh
sleep 5
./bootstrap-nexus.sh
sleep 5
./postDeploy.py
