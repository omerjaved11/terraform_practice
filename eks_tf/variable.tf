variable "eks-cluster-role-name" {
  type = string
  default = "tf-eks-cluster-role"
}

variable "eks-cluster-name" {
  type = string
  default = "tf-eks-cluster"
  
}

variable "subnet_id1" {
  type = string
  default = "subnet-061f0adcc4891a9e7"
}

variable "subnet_id2" {
  type = string
  default = "subnet-08d6391e7461b304b"
}

variable "subnet_id3" {
  type = string
  default = "subnet-0e093dd68011d42e3"
}

variable "eks-node-group-role-name" {
  type = string
  default = "tf-eks-node-group-role"
}

variable "eks-node-group-name" {
  type = string
  default = "tfs-node-group"
}