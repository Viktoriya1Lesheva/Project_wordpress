packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "aws" {
  ami_name      = "wordpress-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-0f403e3180720dd7e"  # Amazon Linux 2023
  ssh_username  = "ec2-user"
  tags = {
    Name = "aws-linux-ami"
  }
}

build {
  name    = "packer"
  sources = [
    "source.amazon-ebs.aws"
  ]
  provisioner "shell" {
    script = "apache.sh"
  }
}
