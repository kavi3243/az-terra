output "subnet_id" {
    value = azurerm_subnet.aks_subnet.id
    description = "The ID of the AKS subnet"
}

output "aks_id" {
    value = azurerm_kubernetes_cluster.aks.id
    description = "The ID of the AKS cluster"
}

output "acr_id" {
    value = azurerm_container_registry.acr.id
    description = "The ID of the ACR"
}

output "app_gateway_id" {
    value = azurerm_application_gateway.app_gateway.id
    description = "The ID of the Application Gateway"
}

output "public_ip_address" {
    value       = azurerm_public_ip.public_ip.ip_address
    description = "The public IP address"
}