terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "ap-south-1"
}



resource "aws_instance" "app_server" {
  count = var.instance_count
  # ami             = "ami-09e07ab949e4de7ef" chirag
  ami             = "ami-067588e1576716304"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]

  tags = {
    Name = "ProxyServer-${count.index + 1}"
  }
}

resource "aws_eip" "lb" {
  count    = var.instance_count
  instance = aws_instance.app_server[count.index].id
  vpc      = true
  tags = {
    "Name" = "ElasticIP-${count.index + 1}"
  }
}
