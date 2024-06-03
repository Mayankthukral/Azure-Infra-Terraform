resource "azurerm_virtual_network" "vnet" {
    location = var.vnet_resource_group_location
    resource_group_name = var.vnet_resource_group_name
    name = var.vnet_name
    address_space = var.vnet_address_space
  
}

