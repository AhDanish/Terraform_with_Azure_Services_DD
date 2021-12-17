locals {
  Env = "TF-learning"
  UseCase = "TF-Test"
  TF-Tags = {
      Env = local.Env
      USeCase = local.UseCase
  }
  resource_name-Suffix = var.NameSuffix
  
  resource_name-Prefix = "Tf"
}

locals {
  web_Inbound_ports_map = {
    "101" : "80"
    "102" : "443"
    "103" : "8081"
  }
}