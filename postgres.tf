resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                   = "postgresqlserver"
  resource_group_name    = azurerm_resource_group.test_rg.name
  location               = azurerm_resource_group.test_rg.location
  version                = "12"
  delegated_subnet_id    = azurerm_subnet.subnet.id
  # private_dns_zone_id    = azurerm_private_dns_zone.example.id
  administrator_login    = "psqladmin"
  administrator_password = var.pgsql_admin_secret
  #zone                   = "1"

  storage_mb = 32768

  sku_name   = "B_Standard_B1ms"
  #depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}