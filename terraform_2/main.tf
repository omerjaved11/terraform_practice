data "aws_security_group" "wizard_sg1" {
  filter {
    name = "group-name"
    values = [ "launch-wizard-1" ]
  }
}

resource "aws_instance" "web1" {
  ami           = var.ami_id
  instance_type = var.itype
  availability_zone = var.az_2b
  key_name = var.key_name
  vpc_security_group_ids = [data.aws_security_group.wizard_sg1.id]
  tags = {
    Name = var.vm_web_1
  }
}
resource "aws_instance" "web2" {
  ami           = var.ami_id
  instance_type = var.itype
  availability_zone = var.az_2b
  key_name = var.key_name
  vpc_security_group_ids = [data.aws_security_group.wizard_sg1.id] 
  tags = {
    Name = var.vm_web_2
  }
}