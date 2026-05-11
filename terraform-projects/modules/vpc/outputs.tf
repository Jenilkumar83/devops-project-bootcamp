output "vpc_id" {
  value = data.aws_vpc.existing.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "internet_gateway_id" {
  value = data.aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  value = local.nat_gateway_id
}

output "route_table_public_id" {
  value = aws_route_table.public.id
}

output "route_table_private_id" {
  value = aws_route_table.private.id
}