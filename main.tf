module "resourcegroup"{
    source = "./module/resourcegroup"
    resource_group_name = "newresourcegroup"
    resource_group_location = "westus2"
}

module"vnet"{
    source = "./module/vnet"
    vnet_resource_group_name = module.resourcegroup.inmodule_resource_group_name
    vnet_resource_group_location = module.resourcegroup.inmodule_resource_group_location
    vnet_name = "vnet1"
}


module"storageaccount"{
    source = "./module/storageaccount"
    storage_resourcegroup_location = module.resourcegroup.inmodule_resource_group_location
    storage_resourcegroup_name = module.resourcegroup.inmodule_resource_group_name
    storage_account_name = "storage17833"

}
