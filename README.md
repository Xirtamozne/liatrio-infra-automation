liatrio-infra-automation
==============

Docker image to extend AWS-CLI to add infrastructure for Liatrio's Project: Gitnexins.
Assumptions: Server has desired AWS credentialing configured and docker and git installed.

Background
----------
``` The fstab/aws-cli container has been extended to support an environment that includes packer, terraform, and ansible, and then bootstraps Jenkins and Nexus on top of a medium t3 AWS instance. See the README.md in the liatrio-infra-automation folder. ```

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
   docker run -t -i liatrio/gitnexins
   ```
Inside the container, there will be a deploy alias to bootstrap the environment.
