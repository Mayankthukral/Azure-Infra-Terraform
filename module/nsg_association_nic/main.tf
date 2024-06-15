resource "azurerm_network_interface_security_group_association" "example_nic_nsg_association" {
  network_interface_id      = var.nsg_association_nic_nic-id # need nic.id
  network_security_group_id = var.nsg_association_nic_nsg-id # need nsg.id
  
}

