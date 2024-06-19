
data "azurerm_ssh_public_key" "SshPublicKey" {
  name                = "scaleset"
  resource_group_name = "DefaultResourceGroup-EUS"
}

output "SshPublicKey" {
  value = data.azurerm_ssh_public_key.SshPublicKey.public_key 
  sensitive = true
}


resource "azurerm_linux_virtual_machine_scale_set" "example" {
  name                = var.VM_scale_set_name
  resource_group_name = var.VM_scale_set_resourcegroup_name
  location            = var.VM_scale_set_resourcegroup_location
  sku                 = "Standard_F2"
  instances           = 1

admin_username      = "adminuser"
  admin_ssh_key {
    username   = "adminuser"
    public_key = data.azurerm_ssh_public_key.SshPublicKey.public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.VM_scale_set_ip_subnet_id
    }
  }
}

resource "azurerm_monitor_autoscale_setting" "example" {
  name                = var.VM_scale_set_autoscale_setting_name
  resource_group_name = var.VM_scale_set_autoscale_setting_resourcegroup_name
  location            = var.VM_scale_set_autoscale_setting_resourcegroup_location
  target_resource_id  = var.VM_scale_set_autoscale_setting_target_resource_id

  profile {
    name = "defaultProfile"

    capacity {
      default = var.autoscale_vm_initial_count
      minimum = var.autoscale_vm_minimum_count
      maximum = var.autoscale_vm_maximum_count
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.example.id
        time_grain         = "PT1M" # determines how often the system checks for metric
        statistic          = "Average" #Specifies how the metrics from multiple instances are combined
        time_window        = "PT5M" #  defines the duration of data collection and analysis.
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = var.autoscale_rule_Increased_CPU_Percentage
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
        dimensions {
          name     = "AppName"
          operator = "Equals"
          values   = ["App1"]
        }
      }

      scale_action {
        direction = "Increase"  # scaling Direction
        type      = "ChangeCount" # type of action that must be met for the alert rule's action to be triggered
        value     = var.autoscale_rule_Increased_CPU_Percentage_additionalVMs #number of instances involved in the scaling action.
        cooldown  = var.autoscale_rule_Increased_CPU_Percentage_cooldownTime #The amount of time to wait since the last scaling action before this action occurs
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.example.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = var.autoscale_rule_Decreased_CPU_Percentage
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = var.autoscale_rule_Decreased_CPU_Percentage_DecreaseCountVMs #number of instances to be decreased in the scaling action.
        cooldown  = var.autoscale_rule_Decreased_CPU_Percentage_cooldownTime  #The amount of time to wait since the last scaling action before this action occurs
      } 
    }
  }


  
}