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
wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.7.1-02-unix.tar.gz
./bootstrap-jenkins.sh
sleep 5
./bootstrap-nexus.sh
sleep 5
./postDeploy.py
