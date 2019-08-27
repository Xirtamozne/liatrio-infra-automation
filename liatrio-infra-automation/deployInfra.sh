echo RUN STARTED:   
date
echo "================================="
./bootstrap-packer.sh
echo "Packer step complete: " 
date
echo "================================="
sleep 5
./bootstrap-terraform.sh
echo "Terraform step complete: " 
date
echo "================================="
sleep 5
./dumpJSONDescribeInstances.sh
sleep 5
scp -i ~/.ssh/LiatrioKeyPairFinal.pem ./postInstall.sh ubuntu@`cat .instanceip`:/home/ubuntu/
sleep 5
ssh -ttqi ~/.ssh/LiatrioKeyPairFinal.pem ubuntu@`cat .instanceip` "sudo -H /home/ubuntu/postInstall.sh"
sleep 5
wget http://mirrors.jenkins-ci.org/plugins/nexus-jenkins-plugin/3.5.20190425-152158.c63841b/nexus-jenkins-plugin.hpi
wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.7.1-02-unix.tar.gz
./bootstrap-jenkins.sh
date
echo "Jenkins step complete: " 
echo "================================="
sleep 5
./bootstrap-nexus.sh
sleep 5
echo "Nexus step complete: " 
date
echo "================================="
./postDeploy.py
echo "Run completes... "
date
echo "================================="
echo "Instance up: "
cat .instanceip
