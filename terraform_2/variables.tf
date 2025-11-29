variable "ami_id" {
  type = string
  description = "Al2 id"
  #default = "ami-08ca1d1e465fbfe0c"
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
variable "vm_web_2" {
    type = string
    description = "Name tag for the instance"
    default = "WebServer2"
}