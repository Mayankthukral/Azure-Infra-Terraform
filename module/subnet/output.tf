
output "module_VM_scaleset_subnet_id" {
  value = azurerm_subnet.subnets["subnet1"].id
}

output "app_gateway_subnet_id" {
  value = azurerm_subnet.subnets["subnet2"].id
}

output "module_VM_scaleset_subnet_name" {
  value = azurerm_subnet.subnets["subnet1"].name
}

output "app_gateway_subnet_name" {
  value = azurerm_subnet.subnets["subnet2"].name
}