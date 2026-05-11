module "cbb_vpc" {
  source              = "./vpc"
  tags                = var.tags
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "cbb_eks" {
  source                               = "./eks"
  environment_name                     = var.environment_name
  business_division                    = var.business_division
  cluster_name                         = var.cluster_name
  cluster_version                      = var.cluster_version
  cluster_service_ipv4_cidr            = var.cluster_service_ipv4_cidr
  cluster_endpoint_private_access      = var.cluster_endpoint_private_access
  cluster_endpoint_public_access       = var.cluster_endpoint_public_access
  cluster_endpoint_public_access_cidrs = var.cluster_endpoint_public_access_cidrs
  node_instance_types                  = var.node_instance_types
  node_capacity_type                   = var.node_capacity_type
  node_disk_size                       = var.node_disk_size
  private_subnet_id                    = module.cbb_vpc.private_subnet_id
  public_subnet_id                     = module.cbb_vpc.public_subnet_id
}
