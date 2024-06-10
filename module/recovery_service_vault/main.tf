resource "azurerm_recovery_services_vault" "name" {
  name                = "exampleRecoveryServicesVault"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard"
}