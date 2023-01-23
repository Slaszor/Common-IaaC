
module "storage" {
  source = "./storage"

  default-prefix = var.default-prefix
  environment = var.environment
}