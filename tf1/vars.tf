variable "region" {
  description = "region for instance"
  type        = string
  default     = "us-east-2"
}

variable "image_id" {
  description = "image_id for instance"
  type        = string
  default     = "ami-083b3f53cbda7e5a4"
}

variable "key" {
  description = "key_name for instance"
  type        = string
  default     = "KP1"
}

variable "az" {
  description = "availabilty zone for instance"
  type        = string
  default     = "us-east-2a"
}

variable "itype" {
  description = "instance type"
  type        = string
  default     = "t2.micro"
}

variable "user1" {
  description = "iam user"
  type        = string
  default     = "tf_user1"
}

variable "group1" {
  description = "iam group"
  type        = string
  default     = "tf_group1"
}