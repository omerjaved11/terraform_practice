# eks cluster role
resource "aws_iam_role" "tf-eks-cluster-role" { 
  name               = var.eks-cluster-role-name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Action" : "sts:AssumeRole"
        "Effect" : "Allow"
        "Principal" : {
          Service : "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "tf-eks-aws_iam_role_policy_attachment" {
  role = aws_iam_role.tf-eks-cluster-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

#eks node group role
resource "aws_iam_role" "tf-eks-node-group-role" { 
  name = var.eks-node-group-role-name
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17"
    "Statement" : [
      {
        "Action" : "sts:AssumeRole"
        "Effect" : "Allow"
        "Principal" : {
          Service : "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "tf_eks_policyattach2" {
  role = aws_iam_role.tf-eks-node-group-role.name #tf_eks_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
resource "aws_iam_role_policy_attachment" "tf_eks_policyattach3" {
  role = aws_iam_role.tf-eks-node-group-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
resource "aws_iam_role_policy_attachment" "tf_eks_policyattach4" {
  role = aws_iam_role.tf-eks-node-group-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

#eks cluster resource
resource "aws_eks_cluster" "tf-eks-cluster" {
  name     = var.eks-cluster-name
  role_arn = aws_iam_role.tf-eks-cluster-role.arn   
  
  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids              = [
        var.subnet_id1,
        var.subnet_id2,
        var.subnet_id3,
    ]
  }
  depends_on = [ aws_iam_role_policy_attachment.tf-eks-aws_iam_role_policy_attachment ]
}

resource "aws_eks_node_group" "tf-eks-node-group" {
    node_group_name = var.eks-node-group-name
    node_role_arn = aws_iam_role.tf-eks-node-group-role.arn
    cluster_name = aws_eks_cluster.tf-eks-cluster.name
    ami_type = "AL2023_x86_64_STANDARD"
        instance_types = ["t2.small"]
    subnet_ids = [
        var.subnet_id1,
        var.subnet_id2,
        var.subnet_id3
    ]
    scaling_config {
        desired_size = 3
        max_size     = 4
        min_size     = 1      
}
  depends_on = [
    aws_eks_cluster.tf-eks-cluster,
    aws_iam_role_policy_attachment.tf_eks_policyattach2,
    aws_iam_role_policy_attachment.tf_eks_policyattach3,
    aws_iam_role_policy_attachment.tf_eks_policyattach4
  ]
}
