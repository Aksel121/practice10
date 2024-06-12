terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}
# configure the AWS provider
provider "aws" {
    region = "us-east-1"
}
 
data "aws_ami" "ubuntu" {
    most_recent = true
 
    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = [  ]
  
}
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var_instance_type
  #instance_type = "t3.micro"
 
    tags ={
        Name = "HelloWorld"
    }
}