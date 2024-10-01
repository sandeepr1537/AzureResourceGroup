terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {}

 subscription_id = "b2cab71b-eb34-4062-9a43-dc2d606ec98f"

}
