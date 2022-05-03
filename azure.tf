resource "azurerm_resource_group" "test_rg" {
  name = "test_rg"
  location = "australiaeast"
}

resource "azurerm_container_registry" "registry" {
  name                = "containerRegistry"
  resource_group_name = azurerm_resource_group.test_rg.name
  location            = azurerm_resource_group.test_rg.location
}
resource "azurerm_role_assignment" "aks_cluster_registry" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.aks_cluster_registry.id
  skip_service_principal_aad_check = true
}