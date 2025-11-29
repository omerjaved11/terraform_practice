resource "aws_instance" "test_assignment" {
  instance_type     = var.itype
  key_name          = var.key
  ami               = var.image_id
  availability_zone = var.az
  vpc_security_group_ids = [ var.sg_id ]

  tags = {
    Name = var.iname
    owner = var.ownername
  }
}

