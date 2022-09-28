terraform {
  backend "azurerm" {
    resource_group_name  = "gregory-craane"
    storage_account_name = "diagnosticc"
    container_name       = "devops-deployments"
    key                  = "terraformgithubexample.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

data "azurerm_client_config" "current" {}

#Create Resource Group
resource "azurerm_resource_group" "gregory-craane_devops" {
  name     = "gregory-craane_devops"
  location = "westeurope"
}

# #Create Virtual Network
# resource "azurerm_virtual_network" "vnet" {
#   name                = "gregory-craane-vnet"
#   address_space       = ["192.168.0.0/16"]
#   location            = "westeurope"
#   resource_group_name = azurerm_resource_group.gregory-craane.name
# }

# # Create Subnet
# resource "azurerm_subnet" "subnet" {
#   name                 = "subnet"
#   resource_group_name  = azurerm_resource_group.gregory-craane.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefix       = "192.168.0.0/24"
# }