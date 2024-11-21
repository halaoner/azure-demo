module "web_app_resource_group" {
  source   = "../modules/management"
  env_name = var.env_name
  location = var.location
}

module "network" {
  source              = "../modules/network"
  env_name            = var.env_name
  location            = var.location
  resource_group_name = module.web_app_resource_group.resouce_group_name
}

module "compute" {
  source              = "../modules/compute"
  env_name            = var.env_name
  location            = var.location
  resource_group_name = module.web_app_resource_group.resouce_group_name
  backend_nic         = module.network.backend_nic
  worker_nic          = module.network.worker_nic
}