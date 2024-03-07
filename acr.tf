# Define ACR-related resources here
resource "azurerm_container_registry" "acr" {
  name                = "sboxacr"
  resource_group_name = azurerm_resource_group.networking.name
  location            = azurerm_resource_group.networking.location
  sku                 = "Standard"
}
