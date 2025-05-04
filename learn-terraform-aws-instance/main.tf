terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "app_sg" {
  vpc_id = "vpc-09f566254e2d603fe"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  subnet_id = "subnet-04e035b4866fe4774"
  user_data = file("${path.module}/script.sh")

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
