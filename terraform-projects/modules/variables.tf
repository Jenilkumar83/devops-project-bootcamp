variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  description = "Global tags to apply to all resources"
  type        = map(string)
  default = {
    Owner       = "jenil"
    Department  = "PES"
    ProjectName = "EIC Internal"
    EndDate     = "EOD"
    BU          = "IA"
    Env         = "Dev"
  }
}

variable "public_subnet_cidr" {
  default = "10.0.22.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.122.0/24"
}

variable "availability_zone" {
  default = "ap-south-1"
}

#EKS

variable "environment_name" {
  description = "Environment name used in resource names and tags"
  type        = string
  default     = "dev"
}

variable "business_division" {
  description = "Business Division in the large organization this infrastructure belongs to"
  type        = string
  default     = "jenil"
}

#eks
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eksdemoj"
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (e.g. 1.28, 1.29)"
  type        = string
  default     = null
}

# CIDR block used for Kubernetes service networking
variable "cluster_service_ipv4_cidr" {
  description = "Service CIDR range for Kubernetes services. Optional — leave null to use AWS default."
  type        = string
  default     = null
}

# Enable access to the EKS API via private endpoint
variable "cluster_endpoint_private_access" {
  description = "Whether to enable private access to EKS control plane endpoint"
  type        = bool
  default     = false
}

# Enable access to the EKS API via public endpoint
variable "cluster_endpoint_public_access" {
  description = "Whether to enable public access to EKS control plane endpoint"
  type        = bool
  default     = true
}

# List of CIDRs allowed to reach the public EKS API endpoint
variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks allowed to access public EKS endpoint"
  type        = list(string)
  default     = ["103.240.204.126/32"]
}

# EKS Node Group Configuration
variable "node_instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
  default     = ["t3.medium"]
}

# Capacity type for node group (ON_DEMAND or SPOT)
variable "node_capacity_type" {
  description = "Instance capacity type: ON_DEMAND or SPOT"
  type        = string
  default     = "ON_DEMAND"
}

# Root volume size (GiB) for worker nodes
variable "node_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}