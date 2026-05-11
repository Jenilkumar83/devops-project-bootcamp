data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["Bootcamp-vpc-do-not-delete-vpc"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

# locals {
#   #   azs = slice(data.aws_availability_zones.available.names, 0, 3)
#   #   public_subnets = [for k, az in local.azs : cidrsubnet(var.vpc_cidr, var.subnet_newbits, k)]
#   #   private_subnets = [for k, az in local.azs : cidrsubnet(var.vpc_cidr, var.subnet_newbits, k + 10)]
# }

data "aws_internet_gateway" "igw" {
  filter {
    name   = "tag:Name"
    values = ["Bootcamp-vpc-do-not-delete-igw"]
  }
}

data "aws_nat_gateways" "nat" {
  filter {
    name   = "tag:Name"
    values = ["Bootcamp-vpc-nat-jenil"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

locals {
  nat_gateway_id = data.aws_nat_gateways.nat.ids[0]
}