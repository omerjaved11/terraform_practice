resource "aws_instance" "terraform_vm1" {
  region            = var.region
  ami               = var.image_id
  key_name          = var.key
  availability_zone = var.az
  instance_type     = var.itype

  tags = {
    "Name" = "tf_vm1"
  }
}