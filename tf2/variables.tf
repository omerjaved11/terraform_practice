variable "ami_id" {
  description = "al2 ami id"
  type        = string
}

variable "itype" {
  description = "instance type t2.micro"
  type        = string
}

variable "az_2b" {
  description = "availability zone for us-east-2b"
  type        = string
}

variable "key_name" {
  description = "key pair KP1"
  type        = string
}

variable "sg_id" {
  description = "security group launch wizard 1"
  type        = string
}

variable "web1_name" {
  description = "instance name"
  type        = string
}

variable "web2_name" {
  description = "instance name"
  type        = string
}