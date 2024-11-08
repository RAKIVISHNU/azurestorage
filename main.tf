terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.2.0"
    }
    tls = {
    source = "hashicorp/tls"
    version = "~>4.0"
      }
  }
}

provider "azurerm" {
  subscription_id = "bc7add54-68b1-4720-a761-75ae4c82e200"
  # client_id = "44e9c1cb-4aa4-4a1f-994d-e35f201193db"
  # client_secret = "tcP8Q~ro5-.MSdnTgh1WPM4sYd_6chn~ZEywUcSa"
  # tenant_id = "d77ec4e8-c88b-431b-8d7f-77755a4bbefc"
  features {}
}

resource "azurerm_resource_group" "rg" {
  name = "vishnurgnew"
  location = "east us"
}

module "storage" {
source = "./storage"
azurerm_resource_group_name = azurerm_resource_group.rg.name
azurerm_resource_group_location = azurerm_resource_group.rg.location
}

output "storageaccount_replication" {
  value = module.storage.storage_replication
}