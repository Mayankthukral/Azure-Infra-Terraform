resource "azurerm_subnet" "subnet1" {
    name = var.subnet_name
    resource_group_name = var.resource_group_name
    virtual_network_name = var.virtual_network_name
}

