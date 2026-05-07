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

# output "nat_gateway_id" {
#   value = local.nat_gateway_id
# }

# output "nat_gateway_details" {
#   value = data.aws_nat_gateways.nat
# }

output "route_table_public_id" {
  value = module.cbb_vpc.route_table_public_id
}

output "route_table_private_id" {
  value = module.cbb_vpc.route_table_private_id
}