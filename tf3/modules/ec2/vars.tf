variable "iname" {
  description = "name for instance"
  type        = string
}

variable "image_id" {
  description = "image_id for instance"
  type        = string
}

variable "key" {
  description = "key_name for instance"
  type        = string
}

variable "az" {
  description = "availabilty zone for instance"
  type        = string
}

variable "itype" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "sg_id" {
  type = string
  description = "my sg"
}

variable "ownername" {
  type = string
  description = "iam owner name"
}