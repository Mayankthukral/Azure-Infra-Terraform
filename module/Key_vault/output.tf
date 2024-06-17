output "module_Key_vault_id" { 
    value = azurerm_key_vault.Key_vault.id
}

output "ssh_key_value"{
    value = azurerm_key_vault_secret.sshKey.value
    sensitive = true
}
