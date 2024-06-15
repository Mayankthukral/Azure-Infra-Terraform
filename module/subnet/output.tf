output "module_subnet_name" {
value = azurerm_subnet.subnet1.name
}

output "module_subnet_resourcegroupname" {
    value = azurerm_subnet.subnet1.resource_group_name

}

output "module_subnet_id" {
    value = azurerm_subnet.subnet1.id
  
}