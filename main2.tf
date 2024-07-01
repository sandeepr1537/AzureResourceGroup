provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example2" {
  name     = "my-resource-group"
  location = "australiaeast"  # Replace with your desired Azure region
}
