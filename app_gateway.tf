resource "azurerm_application_gateway" "app_gateway" {
  name                = "sbox-app-gateway"
  resource_group_name = azurerm_resource_group.networking.name
  location            = azurerm_resource_group.networking.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "sbox-gateway-ip-configuration"
    subnet_id = azurerm_subnet.aks_subnet.id
  }

  frontend_port {
    name = "sbox-frontend-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "sbox-frontend-ip-configuration"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  backend_address_pool {
    name = "sbox-backend-address-pool"
  }

  backend_http_settings {
    name                  = "sbox-backend-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "sbox-http-listener"
    frontend_ip_configuration_name = "sbox-frontend-ip-configuration"
    frontend_port_name             = "sbox-frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "sbox-request-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "sbox-http-listener"
    backend_address_pool_name  = "sbox-backend-address-pool"
    backend_http_settings_name = "sbox-backend-http-settings"
  }

  # ... other configuration for Application Gateway
}
