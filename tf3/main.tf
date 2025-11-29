# module 1
module "module1" {
  source = "./modules/ec2"

  image_id = "ami-083b3f53cbda7e5a4"
  iname    = "instance_module"
  az       = "us-east-2b"
  key      = "KP1"
  sg_id = module.module3.my_sg_id
  ownername = module.module2.my_owner_name
  depends_on = [ module.module2, module.module3 ]
}

# module 2
module "module2" {
  source = "./modules/iam"

  group_name = "m_group"
  user_name  = "m_user"
}

# module 3
module "module3" {
  source = "./modules/security_group"

  sg_name   = "module_sg"
  ssh_port  = 22
  http_port = 80
}

module "module4" {
  source = "./modules/iam_policy"
  
  user_module_name = module.module2.my_owner_name
  depends_on = [ module.module2 ]
}