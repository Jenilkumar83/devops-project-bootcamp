# data "terraform_remote_state" "cbb_vpc" {
#   backend = "s3"

#   config = {
#     bucket = "tfstatej-dev-ap-south-1-sgadsv"
#     key    = "vpc/dev/terraform.tfstate"
#     region = var.aws_region
#   }
# }

# output "vpc_id" {
#   value = data.terraform_remote_state.cbb_vpc.outputs.vpc_id
# }

# output "private_subnet_id" {
#   value = data.terraform_remote_state.cbb_vpc.outputs.private_subnet_id
# }

# output "public_subnet_id" {
#   value = data.terraform_remote_state.cbb_vpc.outputs.public_subnet_id
# }
