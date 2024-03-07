# Define networking-related resources here
resource "azurerm_resource_group" "networking" {
  name     = "sbox-rg"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "sbox-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "sbox-public-ip"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  allocation_method   = "Static"
}