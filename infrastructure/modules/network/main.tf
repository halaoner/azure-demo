# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.app_name
  address_space       = ["10.11.12.0/24"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create subnet for backend
resource "azurerm_subnet" "backend" {
  name                 = "${var.app_name}-${var.env_name}-backend"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.11.12.0/28"]
}

# Create subnet for worker
resource "azurerm_subnet" "worker" {
  name                 = "${var.app_name}-${var.env_name}-worker"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.11.12.16/28"]
}

# Create Network Security Group
resource "azurerm_network_security_group" "backend_nsg" {
  name                = "${var.app_name}-${var.env_name}-backend-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_group" "worker_nsg" {
  name                = "${var.app_name}-${var.env_name}-worker-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create Network Security Rules for backend - SSH
resource "azurerm_network_security_rule" "ssh_backend" {
  name                        = "${var.app_name}-${var.env_name}-backend-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 22
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.backend_nsg.name
  resource_group_name         = var.resource_group_name
}

# Create Network Security Rules for worker - SSH
resource "azurerm_network_security_rule" "ssh_worker" {
  name                        = "${var.app_name}-${var.env_name}-worker-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 22
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.worker_nsg.name
  resource_group_name         = var.resource_group_name
}

# Create Network Security Rules for backend - HTTPS
resource "azurerm_network_security_rule" "backend_https" {
  name                        = "${var.app_name}-${var.env_name}-backend-https"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = 443
  source_address_prefix       = "10.11.12.0/24" # can be set to allow only from 10.11.12.16/28 (worker subnet)
  destination_address_prefix  = "*"             # can be set to target only 10.11.12.0/28 (backend subnet)
  network_security_group_name = azurerm_network_security_group.backend_nsg.name
  resource_group_name         = var.resource_group_name
}

# Connect the security group to the backend subnet
resource "azurerm_subnet_network_security_group_association" "backend_association" {
  subnet_id                 = azurerm_subnet.backend.id
  network_security_group_id = azurerm_network_security_group.backend_nsg.id
}

# Connect the security group to the backedn subnet
resource "azurerm_subnet_network_security_group_association" "worker_association" {
  subnet_id                 = azurerm_subnet.worker.id
  network_security_group_id = azurerm_network_security_group.worker_nsg.id
}

# Create network interface for backend
resource "azurerm_network_interface" "backend_nic" {
  name                = "${var.app_name}-${var.env_name}-backend-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "backend-ip-config"
    subnet_id                     = azurerm_subnet.backend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.backend_ip.id
  }
}

# Create network interface for worker
resource "azurerm_network_interface" "worker_nic" {
  name                = "${var.app_name}-${var.env_name}-worker-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "worker-ip-config"
    subnet_id                     = azurerm_subnet.worker.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.worker_ip.id
  }
}

# Create public IPs for backend
resource "azurerm_public_ip" "backend_ip" {
  name                = "${var.app_name}-${var.env_name}-backend-pub-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}

# Create public IPs for worker
resource "azurerm_public_ip" "worker_ip" {
  name                = "${var.app_name}-${var.env_name}-worker-pub-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
}
