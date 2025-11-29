data "aws_security_group" "wizard_sg_1" {
  filter {
    name   = "group-name"
    values = ["launch-wizard-1"]
  }
}

resource "aws_instance" "web1" {
  ami                    = var.ami_id                               #"ami-083b3f53cbda7e5a4"
  instance_type          = var.itype                                #"t2.micro"
  availability_zone      = var.az_2b                                #"us-east-2b"
  key_name               = var.key_name                             #"KP1"
  vpc_security_group_ids = [data.aws_security_group.wizard_sg_1.id] #["sg-0c873dfffc5000868"]

  tags = {
    Name = var.web1_name #"tf_test1"
  }
}

resource "aws_instance" "web2" {
  ami                    = var.ami_id                               #"ami-083b3f53cbda7e5a4"
  instance_type          = var.itype                                #"t2.micro"
  availability_zone      = var.az_2b                                #"us-east-2b"
  key_name               = var.key_name                             #"KP1"
  vpc_security_group_ids = [data.aws_security_group.wizard_sg_1.id] #["sg-0c873dfffc5000868"]

  tags = {
    Name = var.web2_name #"tf_test2"
  }
}