#Resourcegroup variable
variable "env_resource_group_name" {
  
}

variable "env_resource_group_location" {
  
}

#Vnet variable
variable "env_vnet_name" {
  
}

#subnet name
variable "env_subnet_name" {

}

variable "env_subnet_address_prefixe" {
  default = ["10.0.0.0/16"]
}

#Storage account 
variable "env_storage_account_name" {
  
}
variable "env_storage_account_teir" {
  
}

#Network Interface variable

variable "env_nic_name" {
  
}
variable "env_nic_ip_config_name" {
  
}

variable "env_nic_ip_config_allocation" {
  
}

variable "password" {
 sensitive = true
}

#network security group
variable "env_nsg_name" {
  
}

# VM scale Set Variables 

variable "env_VM_scale_set_name" { }

variable "env_VM_scale_set_sshkey" { }

variable "env_admin_ssh_key_name" { }

variable "env_VM_scale_set_autoscale_setting_name" { }

variable "env_autoscale_vm_initial_count" { }

variable "env_autoscale_vm_maximum_count" { }

variable "env_autoscale_rule_Increased_CPU_Percentage" { }

variable "env_autoscale_rule_Increased_CPU_Percentage_additionalVMs" { }

variable "env_autoscale_rule_Increased_CPU_Percentage_cooldownTime" { }

variable "env_autoscale_rule_Decreased_CPU_Percentage" { }

variable "env_autoscale_rule_Decreased_CPU_Percentage_cooldownTime" { }
