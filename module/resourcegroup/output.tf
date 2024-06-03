output "inmodule_resource_group_id" {
  value = azurerm_resource_group.rg.id
  sensitive = true
}

output "inmodule_resource_group_location"{
  value = azurerm_resource_group.rg.location
}

output "inmodule_resource_group_name"{
  value = azurerm_resource_group.rg.name
}


