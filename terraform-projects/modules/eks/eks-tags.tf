# Public Subnet Tags for EKS Load Balancer Support

resource "aws_ec2_tag" "eks_subnet_tag_public_elb" {
  resource_id = var.public_subnet_id
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_public_cluster" {
  resource_id = var.public_subnet_id
  key         = "kubernetes.io/cluster/${local.eks_cluster_name}"
  value       = "shared"
}

# Private Subnet Tags for EKS Internal LoadBalancer Support

resource "aws_ec2_tag" "eks_subnet_tag_private_elb" {
  resource_id = var.private_subnet_id
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_private_cluster" {
  resource_id = var.private_subnet_id
  key         = "kubernetes.io/cluster/${local.eks_cluster_name}"
  value       = "shared"
}