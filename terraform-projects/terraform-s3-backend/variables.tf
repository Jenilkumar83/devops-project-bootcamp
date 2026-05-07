variable "environment_name" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region to deploy backend (e.g., us-west-2)"
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  type = map(string)
  default = {
    Owner       = "jenil"
    Department  = "PES"
    ProjectName = "EIC Internal"
    EndDate     = "EOD"
    BU          = "IA"
    Env         = "PreDev"
  }
}