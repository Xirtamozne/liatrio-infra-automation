wget https://sonatype-download.global.ssl.fastly.net/nexus/3/nexus-3.7.1-02-unix.tar.gz
ansible-playbook -vvvvi .instanceip.yml ansible-playbooks/install-nexus.yml
