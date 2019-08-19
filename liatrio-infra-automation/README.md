# Deployment of Jenkins/Nexus to EC-2 Instance.

## Requisites:
* Linux-based instance
* Packer
* Terraform
* Ansible
* AWS CLI

## Bootstrapping environment:
* Run deployInfra.sh

## Post installation expectations: 
* Jenkins and Nexus set up in AWS.

## Post-installation configurations:
* Jenkins listening on :8080
* Nexus listening on :8081
* SSH key in pem file in user's home directory (can use getShell.sh to shell to the new instance if necessary) 
	
	* Nexus credentials: 
	*	Username: admin
	*	Password: admin123

## Post-installation setup:
* Configure maven in Global Tools in Jenkins, call it Maven361
* Log in to Nexus and establish the liatrio-mave repo (release type, hosted)
* Point Jenkins instance at GitHub Repo's Jenkinsfile (Create the Pipeline build)
* Establish webhook from GitHub, point it to Jenkins instance (automate on push)

## Tearing down infrastructure:
* teardown.sh

## TODO: 
* Dockerize the installation environment.
* Resolve occasional failure with Ansible deployment of Nexus service. Handled via retry now and finally succeeds, but could be cleaned up.
* Potentially minimize manual post-installation job/repo setup through further automation.
* Automate AMI cleanup
