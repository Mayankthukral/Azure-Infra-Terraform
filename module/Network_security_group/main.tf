
resource "azurerm_network_security_group" "VM_scale_set_NSG" {
  name                = var.network_security_group_name
  location            = var.network_security_group_resource_group_location
  resource_group_name = var.network_security_group_resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}