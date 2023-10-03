provider "azurerm" {
  features {}
  subscription_id="85cd2292-82e3-4c72-a2d7-1ba724a25176"
  client_id="a53107bf-fbf5-40cf-8752-e556704b2c67"
  client_secret="VPc8Q~7Q~lyGaAufy1VwL6hx5M6V~Yd2o_veadzL"
  tenant_id="120709b9-1cde-4a68-944a-f6fb5b566111"
}

resource "azurerm_resource_group" "hybrid" {
  name     = var.resource_group_name
  location = var.location_name
}

resource "azurerm_mysql_server" "hybrid" {
  name                = var.mysql_server_name
  location            = azurerm_resource_group.hybrid.location
  resource_group_name = azurerm_resource_group.hybrid.name

  administrator_login    = var.mysql_server_login
  administrator_login_password = var.mysql_server_password

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  ssl_enforcement_enabled           = false
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "hybrid" {
  name                = "shop_inventory"
  resource_group_name = azurerm_resource_group.hybrid.name
  server_name         = azurerm_mysql_server.hybrid.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

resource "azurerm_mysql_firewall_rule" "hybrid" {
  name                = "hybrid"
  resource_group_name = azurerm_resource_group.hybrid.name
  server_name         = azurerm_mysql_server.hybrid.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
