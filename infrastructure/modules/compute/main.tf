resource "azurerm_linux_virtual_machine" "backend_vm" {
  name                  = "${var.app_name}-${var.env_name}-backend"
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [var.backend_nic.id]
  size                  = "Standard_B1ls"
  admin_username        = "devops"

  admin_ssh_key {
    username   = "devops"
    public_key = file("~/.ssh/hamilton-admin.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "worker_vm" {
  name                  = "${var.app_name}-${var.env_name}-worker"
  resource_group_name   = var.resource_group_name
  location              = var.location
  network_interface_ids = [var.worker_nic.id]
  size                  = "Standard_B1ls"
  admin_username        = "devops"

  admin_ssh_key {
    username   = "devops"
    public_key = file("~/.ssh/hamilton-admin.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
