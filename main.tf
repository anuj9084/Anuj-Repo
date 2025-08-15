# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "anuj-demo-rg"
  location = "East US"
}

# Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = "anujstorage${random_integer.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "demo"
  }
}

# Random suffix for unique storage name
resource "random_integer" "suffix" {
  min = 1000
  max = 9999
}
