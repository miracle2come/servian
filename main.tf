terraform {
    required_providers {
      azurerm ={
        source = "hashicorp/azurerm"
        version = "~>3.03"
      }
      kubernetes = {
        source = "hashicorp/kubernetes"
        version = "~>2.0.0"
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
provider "kubernetes" {
  # Configuration options
  host                   = "${data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host}"
  client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)}"
  client_key             = "${base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)}"
  cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)}"
}
