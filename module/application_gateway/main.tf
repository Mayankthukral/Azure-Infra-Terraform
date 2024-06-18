resource "azurerm_application_gateway" "network" {
  name                = "example-appgateway"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.example.id
  }

  frontend_port {
    name = var.app_gateway_frontend_port
    port = 80
  }

  frontend_ip_configuration {
    name                 = var.app_gateway_frontend_ip_configuration
    public_ip_address_id = azurerm_public_ip.example.id
  }

  backend_address_pool {
    name = var.app_gateway_backend_address_pool
  }

  backend_http_settings {
    name                  = var.app_gateway_backend_http_settings_name
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = var.app_gateway_http_listener_name
    frontend_ip_configuration_name = var.app_gateway_frontend_ip_configuration
    frontend_port_name             = var.app_gateway_frontend_port
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = var.app_gateway_request_routing_rule
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = var.app_gateway_http_listener_name
    backend_address_pool_name  = var.app_gateway_backend_address_pool
    backend_http_settings_name = var.app_gateway_backend_http_settings_name
  }
}