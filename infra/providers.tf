terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.100.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {
    cognitive_account {
      purge_soft_delete_on_destroy = false
    }
  }
}
