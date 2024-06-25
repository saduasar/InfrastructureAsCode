provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  region = "us-east-1"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  cidr_block = {
    cidr1 = "10.0.1.0/24"
    cidr2 = "10.0.2.0/24"
    cidr3 = "10.0.3.0/24"
  }
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.vpc_id
  region = "us-east-1"
}

module "ngw" {
  source           = "./modules/natgateway"
  internet_gateway = module.igw.internet_gateway
  public_subnet_id = module.subnets.public_subnet_id
}

module "routeable" {
  source              = "./modules/routetables"
  internet_gateway_id = module.igw.internet_gateway_id
  nat_gateway_id      = module.ngw.nat_gateway_id
  vpc_id              = module.vpc.vpc_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  public_subnet1_id   = module.subnets.public_subnet1_id
}

module "securitygroups" {
  source = "./modules/securitygroups"
  vpc_id = module.vpc.vpc_id
}

module "instances" {
  source                 = "./modules/instances"
  backend-servers_sg_id  = module.securitygroups.backend-servers_sg_id
  frontend-servers_sg_id = module.securitygroups.frontend-servers_sg_id
  public_subnet_id       = module.subnets.public_subnet_id
  private_subnet_id      = module.subnets.private_subnet_id
  vpc_id                 = module.vpc.vpc_id
  public_subnet1_id      = module.subnets.public_subnet1_id
  instance_type1         = var.instance_type1
}

module "hostedzones" {
  source               = "./modules/hostedzones"
  vpc_id               = module.vpc.vpc_id
  rabbitmq_private_ip  = module.instances.rabbitmq_private_ip
  memcached_private_ip = module.instances.memcached_private_ip
  db_private_ip        = module.instances.db_private_ip
  webapp_private_ip    = module.instances.webapp_private_ip
}

