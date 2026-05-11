output "vpc_id" {
  value = module.cbb_vpc.vpc_id
}

output "public_subnet_id" {
  value = module.cbb_vpc.public_subnet_id
}

output "private_subnet_id" {
  value = module.cbb_vpc.private_subnet_id
}

output "internet_gateway_id" {
  value = module.cbb_vpc.internet_gateway_id
}

output "nat_gateway_id" {
  value = module.cbb_vpc.nat_gateway_id
}

output "route_table_public_id" {
  value = module.cbb_vpc.route_table_public_id
}

output "route_table_private_id" {
  value = module.cbb_vpc.route_table_private_id
}

#EKS
# ------------------------------------------------------------------------------
# Output the EKS Cluster API server endpoint
# Used by kubectl and external tools to communicate with the cluster
# ------------------------------------------------------------------------------
output "eks_cluster_endpoint" {
  value       = module.cbb_eks.eks_cluster_endpoint
  description = "EKS API server endpoint"
}

# ------------------------------------------------------------------------------
# Output the EKS Cluster ID
# Used in AWS CLI commands and automation scripts to reference the EKS cluster
# ------------------------------------------------------------------------------
output "eks_cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = module.cbb_eks.eks_cluster_id
}

# ------------------------------------------------------------------------------
# Output the EKS Cluster Version
# Helpful for students to use this version in other EKS projects 
# to find supported EKS Addons based on EKS cluster version
# ------------------------------------------------------------------------------
output "eks_cluster_version" {
  description = "EKS Kubernetes version"
  value       = module.cbb_eks.eks_cluster_version
}

# ------------------------------------------------------------------------------
# Output the name of the EKS cluster
# Helpful for scripting, `aws eks update-kubeconfig`, etc.
# ------------------------------------------------------------------------------
output "eks_cluster_name" {
  value       = module.cbb_eks.eks_cluster_name
  description = "EKS cluster name"
}


# ------------------------------------------------------------------------------
# Output the EKS Cluster Certificate Authority data
# Needed when setting up kubeconfig or accessing EKS via API
# ------------------------------------------------------------------------------
output "eks_cluster_certificate_authority_data" {
  value       = module.cbb_eks.eks_cluster_certificate_authority_data
  description = "Base64 encoded CA certificate for kubectl config"
}

# ------------------------------------------------------------------------------
# Output the logical name of the private node group
# Useful for autoscaler configs, dashboards, tagging
# ------------------------------------------------------------------------------
output "private_node_group_name" {
  value       = module.cbb_eks.private_node_group_name
  description = "Name of the EKS private node group"
}

# ------------------------------------------------------------------------------
# Output the IAM Role ARN used by the EKS Node Group
# Useful for IRSA setup or attaching additional permissions
# ------------------------------------------------------------------------------
output "eks_node_instance_role_arn" {
  value       = module.cbb_eks.eks_node_instance_role_arn
  description = "IAM Role ARN used by EKS node group (EC2 worker nodes)"
}