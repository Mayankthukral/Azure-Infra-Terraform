resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.nsg_resource_group_location
  resource_group_name = var.nsg_resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

