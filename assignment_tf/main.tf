terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
}
provider "aws" {
    region = "us-east-2"
    shared_credentials_files = ["~/.aws/credentials"]
    profile = "default"
}

variable "ami_id" {
    type = string
    description = "Al2 id"
    default = "ami-08ca1d1e465fbfe0c"
}

variable "itype" {
    type = string
    description = "instance type"
    default = "t2.micro"
}
variable "az_2b" {
    type = string
    description = "availability zone 2b"
    default = "us-east-2b"
}
variable "key_name" {
    type = string
    description = "key name for aws instance"
    default ="vmkey" 
  }
variable "sg_id" {
    type = string   
    description = "security group id"
    default = "sg-082f5a5523afce0f3"
}
variable "vm_web_1" {
    type = string
    description = "Name tag for the instance"
    default = "WebServer1"
}

resource "aws_instance" "web1" {
  ami           = var.ami_id
  instance_type = var.itype
  availability_zone = var.az_2b
  key_name = var.key_name
  tags = {
    Name = var.vm_web_1
  }
}

resource "aws_iam_user" "tfadmin" {
    name = "tfadmin"
}

resource "aws_iam_access_key" "tfadmin_key" {
    user = aws_iam_user.tfadmin.name
  
}

resource "aws_iam_user_login_profile" "tfadmin_profile" {
    user = aws_iam_user.tfadmin.name
    password_reset_required = true  
}

output "tfadmin_username" {
  value = aws_iam_user.tfadmin.name
}

output "access_key" {
    value = aws_iam_access_key.tfadmin_key.id
    sensitive = true
}

output "secert_access_key" {
  value = aws_iam_access_key.tfadmin_key.secret
  sensitive = true
}

resource "aws_iam_group" "tfgroup" {
    name = "tfgroup"
}

resource "aws_iam_user_group_membership" "add_user" {
  user =  aws_iam_user.tfadmin.name 
  groups = [ aws_iam_group.tfgroup.name ]    
}

resource "aws_iam_policy" "admin_group_policy" {
  name = "admin_group_policy"
  policy = jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "adminGroupPolicy",
			"Effect": "Allow",
			"Action": ["ec2:*","s3:*"],
			"Resource": "*"
		}
	]
})
  
}

resource "aws_iam_group_policy_attachment" "name" {
  group = aws_iam_group.tfgroup.name
    policy_arn = aws_iam_policy.admin_group_policy.arn
}


data "aws_vpc" "default" {
    default = true
}

resource "aws_security_group" "admin_security_group" {
  name        = "admin_security_group"
  description = "Security group for admin user"
  vpc_id      = data.aws_vpc.default.id

    ingress {
        description = "SSH access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTP access"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
