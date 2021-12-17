resource "azurerm_network_security_group" "webrnsg" {
  name = "${local.resource_name-Prefix}-websubnet"
  location = var.location
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
}

resource "azurerm_subnet_network_security_group_association" "Tfassnsgtowebsubnet" {
  network_security_group_id = azurerm_network_security_group.webrnsg.id
  subnet_id = azurerm_subnet.tfrwebsubnet.id
  depends_on = [
    azurerm_network_security_rule.webrsnsg_inbound_Rule
  ]
}

resource "azurerm_network_security_rule" "webrsnsg_inbound_Rule" {
  for_each = local.web_Inbound_ports_map
  name = "Allowe_IN-${each.value}"
  priority = each.key
  direction = "Inbound"
  access = "Allow"
  protocol = "Tcp"
  source_port_range = "*"
  destination_port_range = each.value
  source_address_prefix = "*"
  destination_address_prefix = "*"
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
  network_security_group_name = azurerm_network_security_group.webrnsg.name
}

