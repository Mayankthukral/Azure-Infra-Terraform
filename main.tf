module "resourcegroup"{
    source = "./module/resourcegroup"
    resource_group_name = var.env_resource_group_name
    resource_group_location = var.env_resource_group_location
}

module"vnet"{
    source = "./module/vnet"
    vnet_resource_group_name = module.resourcegroup.inmodule_resource_group_name
    vnet_resource_group_location = module.resourcegroup.inmodule_resource_group_location
    vnet_name = var.env_vnet_name
}

module "subnet" {
    source = "./module/subnet"
    subnet_name = var.env_subnet_name
    resource_group_name = module.resourcegroup.inmodule_resource_group_name
    virtual_network_name = module.vnet.module_vnet_name
    address_prefixes = var.env_subnet_address_prefixe
}

module"storageaccount"{
    source = "./module/storageaccount"
    storage_resourcegroup_location = module.resourcegroup.inmodule_resource_group_location
    storage_resourcegroup_name = module.resourcegroup.inmodule_resource_group_name
    storage_account_name = var.env_storage_account_name
    storage_account_account_tier = var.env_storage_account_teir
}



module "Network_interface"{
    source = "./module/Network_interface"
    VM_scale_set_nic_name = var.env_nic_name
    nic_resource_group_location = module.resourcegroup.inmodule_resource_group_location
    nic_resource_group_name = module.resourcegroup.inmodule_resource_group_name
    nic_ip_configuration_name = var.env_nic_ip_config_name
    nic_ip_configuration_subnetid= module.subnet.module_subnet_id
    nic_ip_address_allocation = var.env_nic_ip_config_allocation
}

module "Network_security_group" {
    source = "./module/Network_security_group"
    network_security_group_name = var.env_nsg_name
    network_security_group_resource_group_location = module.resourcegroup.inmodule_resource_group_location
    network_security_group_resource_group_name = module.resourcegroup.inmodule_resource_group_name
}

# Network security group is associated with Network Interface Card as seprate resource as follow 

module "network_interface_security_group_association"{
    source = "./module/nsg_association_nic"
    nsg_association_nic_nic-id = module.Network_interface.module_nic_id
    nsg_association_nic_nsg-id = module.Network_security_group.module_NSg_id
}

# Vm Scale set module

module "VM_scale_set"{
    source = "./module/VM_Scale_Set"
    VM_scale_set_name = var.env_VM_scale_set_name
    VM_scale_set_resourcegroup_name = module.resourcegroup.inmodule_resource_group_name
    VM_scale_set_resourcegroup_location = module.resourcegroup.inmodule_resource_group_location
    VM_scale_set_sshkey = var.env_VM_scale_set_sshkey
    admin_ssh_key_name = var.env_admin_ssh_key_name
    VM_scale_set_ip_subnet_id = module.subnet.module_subnet_id
    VM_scale_set_autoscale_setting_name =var.env_VM_scale_set_autoscale_setting_name
    VM_scale_set_autoscale_setting_resourcegroup_name = module.resourcegroup.inmodule_resource_group_name
    VM_scale_set_autoscale_setting_resourcegroup_location = module.resourcegroup.inmodule_resource_group_location
    VM_scale_set_autoscale_setting_target_resource_id = module.VM_scale_set.module_vmScaleset_ID
    autoscale_vm_initial_count =  var.env_autoscale_vm_initial_count
    autoscale_vm_maximum_count =  var.env_autoscale_vm_maximum_count
    autoscale_rule_Increased_CPU_Percentage = var.env_autoscale_rule_Increased_CPU_Percentage
    autoscale_rule_Increased_CPU_Percentage_additionalVMs = var.env_autoscale_rule_Increased_CPU_Percentage_additionalVMs
    autoscale_rule_Increased_CPU_Percentage_cooldownTime =  var.env_autoscale_rule_Increased_CPU_Percentage_cooldownTime
    autoscale_rule_Decreased_CPU_Percentage = var.env_autoscale_rule_Decreased_CPU_Percentage
    autoscale_rule_Decreased_CPU_Percentage_cooldownTime = var.env_autoscale_rule_Decreased_CPU_Percentage_cooldownTime
}

