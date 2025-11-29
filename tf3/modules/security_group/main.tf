data "aws_vpc" "default_vpc" {
  id = "vpc-02691f1d92d2ad277"
}

resource "aws_security_group" "as_sg" {
  name   = var.sg_name
  vpc_id = data.aws_vpc.default_vpc.id
}

resource "aws_security_group_rule" "sg_rule_http" {
  type              = "ingress"
  from_port         = var.http_port
  to_port           = var.http_port
  protocol          = "tcp"
  security_group_id = aws_security_group.as_sg.id
  cidr_blocks       = [data.aws_vpc.default_vpc.cidr_block]
}

resource "aws_security_group_rule" "sg_rule_ssh" {
  type              = "ingress"
  from_port         = var.ssh_port
  to_port           = var.ssh_port
  protocol          = "tcp"
  security_group_id = aws_security_group.as_sg.id
  cidr_blocks       = [data.aws_vpc.default_vpc.cidr_block]
}