output "resource_group_location" {
  description = "Region of the resource group"
  value       = azurerm_resource_group.web_app.location
}

output "resouce_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.web_app.name
}
