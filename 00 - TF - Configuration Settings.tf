terraform {
  required_version = ">= 1.0.0"
  
  required_providers {
    azurerm = {
      source = "Hashicorp/azurerm"
      version = ">=2.84.0"
    }
      random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
  
}
provider "azurerm" {
    features {}
  # Configuration options
  //Azure Provider
  /*Azure Terraform
  learning */
}