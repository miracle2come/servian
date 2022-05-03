data "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks_cluster"
  resource_group_name = azurerm_resource_group.test_rg.name
}