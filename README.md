liatrio-infra-automation
==============

Docker image to add infrastructure for Liatrio's Project: Gitnexins.
Assumptions: Server has desired AWS credentialing configured and docker and git installed.

Background
----------
``` Deliver a CI-CD platform that includes packer, terraform, and ansible, and then bootstraps Jenkins and Nexus on top of an EC-2 instance. See the README.md in the liatrio-infra-automation folder. ```

To Build
-----------------
   ```bash
   git clone https://github.com/Xirtamozne/liatrio-infra-automation.git
   ```
   ```bash
   cd liatrio-infra-automation
   docker build -t="liatrio/gitnexins" .
   ```
   ```bash
   docker run -t -v ~/.aws:/home/aws/.aws -i liatrio/gitnexins
   ```
Inside the container, there will be a deploy alias to bootstrap the environment.
