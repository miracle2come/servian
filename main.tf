terraform {
    required_providers {
      azurerm ={
          source = "hashicorp/azurerm"
          version = "~>2.80"
      }
    }    
}

provider "azurerm" {
  features {}
  subscription_id = var.ARM_SUBSCRIPTION_ID
  tenant_id = var.ARM_TENANT_ID
  client_id = var.ARM_CLIENT_ID
  client_secret = var.ARM_CLIENT_SECRET
}

resource "azurerm_resource_group" "test_rg" {
  name = "test_rg"
  location = "australiaeast"
}
#resource "azurerm_kubernetes_cluster" "aks_cluster" {
#    name = "aks_cluster"
#    location = azurerm_resource_group.test_rg.location
#    resource_group_name = azurerm_resource_group.test_rg.name
#  
#}