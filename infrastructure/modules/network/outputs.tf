output "backend_ip" {
  description = "Public IP address of backend"
  value       = azurerm_public_ip.backend_ip.ip_address
}

output "worker_ip" {
  description = "Public IP address of worker"
  value       = azurerm_public_ip.worker_ip.ip_address
}

output "backend_nic" {
  description = "Backend network interface"
  value       = azurerm_network_interface.backend_nic
}

output "worker_nic" {
  description = "Worker network interface"
  value       = azurerm_network_interface.worker_nic
}