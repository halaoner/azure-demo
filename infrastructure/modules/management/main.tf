resource "azurerm_resource_group" "web_app" {
  name     = var.resource_group_name
  location = var.location
}