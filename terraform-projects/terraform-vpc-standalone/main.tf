module "cbb_vpc" {
  source = "./modules/vpc"
  tags   = var.tags
}