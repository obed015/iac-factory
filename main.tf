terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.64"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "UK West"
}

data "azurerm_resource_group" "existing_rg" {
  name = "HybridCloudRG"
}

resource "azurerm_virtual_network" "iac_factory_vnet" {
  name                = "iac-factory-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
}
