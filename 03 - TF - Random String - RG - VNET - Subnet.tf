resource "random_string" "randomname" {
  length = 14
  upper = false
  special = false
}

resource "azurerm_resource_group" "Tf-Rg-01" {
  name = "${local.resource_name-Prefix}-${var.NameSuffix}-01"
  location = var.location
  tags = local.TF-Tags
}

resource "azurerm_virtual_network" "tfVnet" {
  count = var.Env == "Dev" ? 1 : 2  # This expression is if env is dev create one VNET if not then create two VNets
  name = "${local.resource_name-Prefix}-${var.VnetName}-${count.index}"
  location = var.location
  tags = local.TF-Tags
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
  address_space = ["15.0.0.0/16"]
  #address_space = [var.VNet-AddressSpace[0]] # This mean if you want to only take one address space out of three
  #address_space = local.VNET_Address_Space
}

resource "azurerm_subnet" "tfrwebsubnet" {
  name = var.WebSubnetName
  address_prefixes = var.WebSubnetAddressPrefix
  virtual_network_name = azurerm_virtual_network.tfVnet.name
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
}

resource "azurerm_public_ip" "tfrpip01" {
  name = "tfpip01"
  location = azurerm_resource_group.Tf-Rg-01.location
  resource_group_name = azurerm_resource_group.Tf-Rg-01.name
  #sku = var.publicipsku["canadacentral"]
  sku = lookup(var.publicipsku, var.location, "Basic")
  allocation_method = "Static"
  
}

