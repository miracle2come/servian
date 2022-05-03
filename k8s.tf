resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name = "aks_cluster"
  location = azurerm_resource_group.test_rg.location
  resource_group_name = azurerm_resource_group.test_rg.name
  sku_tier = "Free"

  default_node_pool {
    name = "default"
    node_count = 1
    vm_size = "Standard_B1"
  }
    identity {
    type = "SystemAssigned"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

#resource "kubernetes_deployment" "test" {
#  metadata {
#    name      = "nginx"
#    namespace = kubernetes_namespace.test.metadata.0.name
#  }
#  spec {
#    replicas = 1
#    selector {
#      match_labels = {
#        app = "TestApp"
#      }
#    }
#    template {
#      metadata {
#        labels = {
#          app = "TestApp"
#        }
#      }
#      spec {
#        container {
#          image = "nginx"
#          name  = "nginx-container"
#          port {
#            container_port = 80
#          }
#          resources {
#            limits = {
#              cpu    = "0.5"
#              memory = "512Mi"
#            }
#            requests = {
#              cpu    = "250m"
#              memory = "50Mi"
#            }
#          }
#
#          liveness_probe {
#            http_get {
#              path = "/"
#              port = 80
#
#              http_header {
#                name  = "X-Custom-Header"
#                value = "Awesome"
#              }
#            }
#
#            initial_delay_seconds = 3
#            period_seconds        = 3
#          }
#        }
#      }
#    }
#  }
#}
#
#
#
#
#resource "kubernetes_service" "test" {
#  metadata {
#    name      = "nginx"
#    namespace = kubernetes_namespace.test.metadata.0.name
#  }
#  spec {
#    selector = {
#      app = kubernetes_deployment.test.spec.0.template.0.metadata.0.labels.app
#    }
#    type = "NodePort"
#    port {
#      node_port   = 30201
#      port        = 80
#      target_port = 80
#    }
#  }
#}
#
########

resource "kubernetes_pod" "test" {
  metadata {
    name = "terraform-example"
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "example"

      env {
        name  = "environment"
        value = "test"
      }

      port {
        container_port = 80
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 80

          http_header {
            name  = "X-Custom-Header"
            value = "Awesome"
          }
        }

        initial_delay_seconds = 3
        period_seconds        = 3
      }
    }

    dns_config {
      nameservers = ["1.1.1.1", "8.8.8.8", "9.9.9.9"]
      searches    = ["example.com"]

      option {
        name  = "ndots"
        value = 1
      }

      option {
        name = "use-vc"
      }
    }

    dns_policy = "None"
  }
}