variable "VM_scale_set_nic_name" {
  default = "smaplenic"
}

variable "nic_resource_group_location" {
  default = "westus2"
}

variable "nic_resource_group_name" {
  default = "sampleresourcegroup"
}

variable "nic_ip_configuration_name" {
  default = "sampleipconfig"
}

variable "nic_ip_configuration_subnetid" {
  
}

variable "nic_ip_address_allocation" {
    default = "Static"
  
}

