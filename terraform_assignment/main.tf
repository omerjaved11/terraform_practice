resource "aws_instance" "test_assignment" {
  instance_type     = "t2.micro"
  key_name          = "KP1"
  ami               = "ami-0b016c703b95ecbe4"
  availability_zone = "us-east-2b"

  tags = {
    Name = "test_assignment"
  }
}