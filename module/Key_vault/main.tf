provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_keys_on_destroy = false
      recover_soft_deleted_keys          = false
    }
  }
}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "Key_vault" {
  name                       = var.Key_vault_name
  location                   = var.Key_vault_resourcegroup_location
  resource_group_name        = var.Key_vault_resourcegroup_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Delete",
      "Get",
      "Purge",
      "Recover",
      "Update",
      "GetRotationPolicy",
      "SetRotationPolicy"
    ]

    secret_permissions = [
      "Set",
    ]
  }
}

resource "azurerm_key_vault_secret" "sshKey" {
 name         = var.ssh_Key_name
  value        = filebase64("C:\\Users\\mayan\\.ssh\\id_rsa.pub")  # Path to your SSH public key
  key_vault_id = azurerm_key_vault.keyvault.id
}

output "module_Key_vault_id" { 
    value = azurerm_key_vault.Key_vault.id
}

output "ssh_key_value"{
    value = azurerm_key_vault_secret.sshKey.value
    sensitive = true
}
