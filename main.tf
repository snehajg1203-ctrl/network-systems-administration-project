# main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6.0"
}

provider "aws" {
  region = "eu-west-1"   # Ireland region
}

resource "aws_instance" "web" {
  ami                    = "ami-04b4f1a9cf54c11d0"  # Ubuntu 22.04 LTS (Ireland)
  instance_type          = "t2.micro"
  key_name               = "terraform-key"          # Must match your AWS key pair
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "TerraformWebServer"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
