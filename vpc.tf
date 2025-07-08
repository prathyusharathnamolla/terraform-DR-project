module "primary_vpc" {
  source                = "./modules/vpc_module"
  providers             = { aws = aws.primary }
  name_prefix           = "primary"
  vpc_cidr              = var.primary_vpc_cidr
  public_subnet_cidr    = var.primary_public_subnet_cidr
  private_subnet_cidr   = var.primary_private_subnet_cidr
  availability_zone     = "${var.primary_region}a"
}

module "secondary_vpc" {
  source                = "./modules/vpc_module"
  providers             = { aws = aws.secondary }
  name_prefix           = "secondary"
  vpc_cidr              = var.secondary_vpc_cidr
  public_subnet_cidr    = var.secondary_public_subnet_cidr
  private_subnet_cidr   = var.secondary_private_subnet_cidr
  availability_zone     = "${var.secondary_region}a"
}