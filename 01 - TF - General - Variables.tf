variable "location" {
  description = "Resource location"
  type = string
  validation {
    condition = var.location =="canadacentral" || var.location == "canadaeast"
    #condition = contains(["canadacentral", "canadaeast"], var.location)
    #condition = can(regex("india$", var.location))
    error_message = "Resources are only allowed in Canada."
  }
}

 variable "Env" {
   type = string
   default = "Dev"
 }
/*
variable "db_thrtdetpolicy" {
  type = object({
   enabled = bool
   retention_days = number
   email_account_admins = bool
   email_addresses = list(string)
  })
}*/

variable "db_thrtdetpolicy" {
  type = tuple([bool, number, bool, list(string)])
}

variable "NameSuffix" {
    description = "Name suffix to be used for resources"
    type = string
}

variable "VnetName" {
  type = string
  default = "Vnet01"
}

variable "VNet-AddressSpace-prod" {
  type = list(string)
  default = ["11.0.0.0/16", "14.0.0.0/16", "15.0.0.0/16"]
}

variable "VNET-AddressSpace-Dev" {
  type = list(string)
  default = [ "20.0.0.0/16" ]
}
variable "WebSubnetName" {
  type = string
  default = "tfWebSubnet01"
}

variable "WebSubnetAddressPrefix" {
  type = list(string)
  default = ["11.0.1.0/24"]
}

variable "AppSubnetName" {
  type = string
  default = "tfappSubnet01"
}

variable "AppSubnetAddressPrefix" {
  type = list(string)
  default = ["11.0.2.0/24"]
}

variable "DbSubnetName" {
  type = string
  default = "tfdbSubnet01"
}

variable "dbSubnetAddressPrefix" {
  type = list(string)
  default = ["11.0.3.0/24"]
}

variable "BastionSubnetName" {
  type = string
  default = "tfbastionSubnet01"
}

variable "BastionSubnetAddressPrefix" {
  type = list(string)
  default = ["11.0.4.0/24"]
}

variable "publicipsku" {
  type = map (string)
  default = {
    "canadacentral" = "Basic",
    "canadaeast" = "Standard"
  }
  }

variable "common_Tags" {
  type = map(string)
  default = {
    "Env" = "terraform",
    case = "learning"
  }
}

variable "mysqldb_Name" {
  type = string
}

variable "mysqldb_username" {
  type = string
  sensitive = true
}

variable "mysqldb_password" {
  type = string
  sensitive = true
}

variable "db_storage_mb" {
  type = number
}

variable "db_auto_grow_enabled" {
  type = bool
}


