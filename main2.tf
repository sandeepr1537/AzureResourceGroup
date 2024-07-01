provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "my-resource-group"
  location = "australiaeast  # Replace with your desired Azure region
}
