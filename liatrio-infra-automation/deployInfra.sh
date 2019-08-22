./bootstrap-packer.sh
./bootstrap-terraform.sh
sleep 5
./dumpJSONDescribeInstances.sh
scp -i ~/.ssh/LiatrioKeyPairFinal.pem ./postInstall.sh ubuntu@`cat .instanceip`:/home/ubuntu/
ssh -ttqi ~/.ssh/LiatrioKeyPairFinal.pem ubuntu@`cat .instanceip` "sudo /home/ubuntu/postInstall.sh"
sleep 5
./bootstrap-jenkins.sh
./bootstrap-nexus.sh
./bootstrap-nexus.sh
./postDeploy.py
