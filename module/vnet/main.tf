resource "azurerm_virtual_network" "vnet" {
    location = var.vnet_resource_group_location
    resource_group_name = var.vnet_resource_group_name
    name = "vnet1"
    address_space = ["10.0.0.0/16"]
  
}