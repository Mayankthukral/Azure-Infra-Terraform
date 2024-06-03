resource "azurerm_storage_account" "storage1" {
    name = var.storage_account_name
    resource_group_name = var.storage_resourcegroup_name
    account_tier = var.storage_account_account_tier
    location = var.storage_resourcegroup_location
    account_replication_type = "LRS"
  
}






