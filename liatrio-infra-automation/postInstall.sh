apt -y update && apt install -y python
apt -y install python-pip
pip install requests
pip install httplib2
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
chown ubuntu /etc/apt/sources.list
echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
apt-get update
apt-get install jenkins
