resource "azurerm_mysql_server" "tfrmysql" {
  name = "${var.mysqldb_Name}-${var.NameSuffix}"
  location = var.location
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
  administrator_login = var.mysqldb_username
  administrator_login_password = var.mysqldb_password
  auto_grow_enabled = var.db_auto_grow_enabled

  sku_name = "GP_Gen5_2"
  storage_mb = var.db_storage_mb
  version = "8.0"

/*
  threat_detection_policy {
    enabled = var.db_thrtdetpolicy.enabled
    retention_days = var.db_thrtdetpolicy.retention_days
    email_account_admins = var.db_thrtdetpolicy.email_account_admins
    email_addresses = var.db_thrtdetpolicy.email_addresses
  }
  */

  threat_detection_policy {
    enabled = var.db_thrtdetpolicy[0]
    retention_days = var.db_thrtdetpolicy[1]
    email_account_admins = var.db_thrtdetpolicy[2]
    email_addresses = var.db_thrtdetpolicy[3]
  }

  backup_retention_days = 7
  geo_redundant_backup_enabled = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled = true
  ssl_enforcement_enabled = true 
  #ssl_minimal_tls_version_enforced = "TLS_2.1"

}

resource "azurerm_mysql_database" "tfrwebappdb01" {
  name = "webappdb01"
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
  server_name = azurerm_mysql_server.tfrmysql.name
  charset = "utf8"
  collation = "utf8_unicode_ci"
}