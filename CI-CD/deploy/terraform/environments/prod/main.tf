module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  availability_zones = var.availability_zones

  enable_nat_gateway = true
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment

  force_delete = false
}

module "alb" {
  source = "../../modules/alb"

  project_name = var.project_name
  environment  = var.environment

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids

  app_port = 8080

  enable_deletion_protection = true
}

module "monitoring" {
  source = "../../modules/monitoring"

  project_name = var.project_name
  environment  = var.environment

  log_retention_days = 30
}

module "ecs" {
  source = "../../modules/ecs"

  project_name = var.project_name
  environment  = var.environment
  aws_region   = var.aws_region

  vpc_id = module.network.vpc_id


  subnet_ids = module.network.public_subnet_ids

  assign_public_ip = false

  alb_security_group_id = module.alb.alb_security_group_id
  target_group_arn      = module.alb.target_group_arn

  ecr_repository_url = module.ecr.repository_url

  cloudwatch_log_group_name = module.monitoring.log_group_name

  container_name = "actuator-demo"
  container_port = 8080

  task_cpu    = 512
  task_memory = 1024

  desired_count = 2

  image_tag = var.image_tag
}