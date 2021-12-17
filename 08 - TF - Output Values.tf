output "RgName" {
  value = azurerm_resource_group.Tf-Rg-01.name
}

/*
output "VnetName" {
  value = azurerm_virtual_network.tfVnet[*].name
}
*/

output "azurerm_mysql_server_Admin_Pass" {
  value = azurerm_mysql_server.tfrmysql.administrator_login_password
  sensitive = true
}

