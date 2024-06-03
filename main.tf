module "resourcegroup"{
    source = "./module/resourcegroup"
}

module"vnet"{
    source = "./module/vnet"
    vnet_resource_group_name = module.resourcegroup.inmodule_resource_group_name
    vnet_resource_group_location = module.resourcegroup.inmodule_resource_group_location
}

output "resource_group_name" {
    value = module.resourcegroup.inmodule_resource_group_name
  
}

output "resource_group_id" {
    value = module.resourcegroup.inmodule_resource_group_id
  
}

output "resource_group_location" {
    value = module.resourcegroup.inmodule_resource_group_location
  
}