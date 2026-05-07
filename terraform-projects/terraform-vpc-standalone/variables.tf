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
  default = "ap-south-1a"
}