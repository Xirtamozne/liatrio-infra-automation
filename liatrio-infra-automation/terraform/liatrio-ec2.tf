provider "aws" {
    access_key = "AWSACCESSKEY"
    secret_key = "AWSSECRETKEY"
    region = "us-east-1"
}

data "aws_ami" "ec2-ami" {
  filter {
    name   = "state"
    values = ["available"]
  }
  filter {
    name   = "tag:Name"
    values = ["Liatrio-Project-AMI"]
  }
  owners=["282458246159"]
  most_recent = true
}

resource "aws_instance" "liatrio-jenkins-nexus" {
    ami = "${data.aws_ami.ec2-ami.id}"
    key_name = "LiatrioKeyPairFinal"
    instance_type = "t2.medium"
    tags = {
        Name = "liatrio-jenkins-nexus"
    }
}
