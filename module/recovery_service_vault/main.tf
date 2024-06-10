resource "azurerm_recovery_services_vault" "name" {
  name                = var.recovery_service_vault_name
  location            = var.rescovery_service_vault_resource_group_loctaion
  resource_group_name = var.rescovery_service_vault_resource_group_name
  sku                 = "Standard"
}

