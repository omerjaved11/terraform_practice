output "web1_ec2_public_ip" {
  description = "public ip of ec2 instance"
  value = aws_instance.web1.public_ip
}

output "web2_ec2_public_ip" {
  description = "public ip of ec2 instance"
  value = aws_instance.web2.public_ip
}

output "web1_id" {
  description = "id of ec2 web1 instance"
  value = aws_instance.web1.id
}

output "web2_id" {
  description = "id of ec2 web2 instance"
  value = aws_instance.web2.id
}