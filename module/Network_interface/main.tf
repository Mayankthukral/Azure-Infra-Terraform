resource "azurerm_network_interface" "VM_scale_set_nic" {
  name                = var.VM_scale_set_nic_name
  location            = var.nic_resource_group_location
  resource_group_name = var.nic_resource_group_name

  ip_configuration {
    name                          = var.nic_ip_configuration_name
    subnet_id                     = var.nic_ip_configuration_subnetid
    private_ip_address_allocation = var.nic_ip_address_allocation
  }
}
