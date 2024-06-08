
variable "vm_subnet" {
    default = "samplesubnet"
  
}

variable "vm_resource_group_name" {
    default = "sampleresourcegroup"
  
}

variable "vm_network_interface_name" {
    default = "smaplenetworkinterface"
  
}

variable "vm_network_interface_location" {
    default = "westus2"
  
}

variable "vm_name" {
  default = "samplevm"
}

variable"vm_resource_group_location"{
    default = "westus2"
}

variable"vm_password"{
    
}

resource "azurerm_network_interface" "main" {
  name                = var.vm_network_interface_name
  location            = var.vm_network_interface_location
  resource_group_name = var.vm_resource_group_name

  ip_configuration {
    name                          = "var.vm_ip_configuration_name"
    subnet_id                     = var.vm_subnet
    private_ip_address_allocation = "static"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm_name
  location              = var.vm_resource_group_location
  resource_group_name   = var.vm_resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "var.vm_password"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}