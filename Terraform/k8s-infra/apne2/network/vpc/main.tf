module "vpc" {
  source = "../../../module/network/vpc"

  vpc_cidr_block       = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_tags             = var.vpc_tags
  azs                  = var.azs
  pub_subnet           = var.sub_cidr_block.public
  name                 = "Jeewoong-k8s-infra"
}
