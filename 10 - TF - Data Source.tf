data "azurerm_resource_group" "tfdrRg" {
  name = "Rg-Bicep01"
}

output "Rgname" {
  value = data.azurerm_resource_group.tfdrRg.id
}