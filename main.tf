# main.tf
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    ServiceName  = "MyService"
    ServiceOwner = "YourName"
    Environment  = "Development"
  }
}
