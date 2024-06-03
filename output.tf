output "resource_group_name" {
    value = module.resourcegroup.inmodule_resource_group_name
  
}

output "resource_group_id" {
    value = module.resourcegroup.inmodule_resource_group_id
    sensitive = "true"
  
}

output "resource_group_location" {
    value = module.resourcegroup.inmodule_resource_group_location
  
}