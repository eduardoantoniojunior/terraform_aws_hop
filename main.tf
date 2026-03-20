module "network" {
  source = "./modules/network"

  project_name       = var.project_name
  tags               = local.tags
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"
}

module "hop_app" {
  source = "./modules/app"

  project_name     = var.project_name
  tags             = local.tags
  vpc_id           = module.network.vpc_id
  public_subnet_id = module.network.public_subnet_id
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_name         = var.key_name
  cidr_blocks      = var.cidr_blocks
  hop_version      = var.hop_version
  hop_user         = var.hop_user
  hop_password     = var.hop_password
  region           = var.region
}