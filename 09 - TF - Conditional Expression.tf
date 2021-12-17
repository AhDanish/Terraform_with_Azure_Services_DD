locals {
 # VNET_Address_Space = (var.Env == "Dev" ? var.VNET-AddressSpace-Dev : var.VNet-AddressSpace-prod) # This expression is if env is DEV then provide the DEV Address space if env is not Dev then provide prod address space
 VNET_Address_Space = (var.Env != "Dev" ? var.VNet-AddressSpace-prod : var.VNET-AddressSpace-Dev ) # This expression is if env is not DEV then provide the prod Address space if env is  Dev then provide prod address space
}