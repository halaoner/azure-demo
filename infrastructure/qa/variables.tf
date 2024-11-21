variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "devops-interview"
}

variable "app_name" {
  description = "The application name"
  type        = string
  default     = "vent4cloud"
}

variable "env_name" {
  description = "The environment name (mandatory)"
  type        = string
}

variable "location" {
  description = "The Azure region for resources"
  type        = string
  default     = "Central US"
}
