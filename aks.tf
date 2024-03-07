# Define AKS-related resources here
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "sbox-aks-cluster"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  dns_prefix          = "sbox-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  identity {
    type = "SystemAssigned"
  }
}
