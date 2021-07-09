resource "azurerm_resource_group" "yogesh-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "yogesh-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.yogesh-rg1.name
  location                 = azurerm_resource_group.yogesh-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "yogesh-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.yogesh-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "yogeshblob" {
  name                   = "yogeshblob"
  storage_account_name   = azurerm_storage_account.yogesh-sa.name
  storage_container_name = azurerm_storage_container.yogesh-sc.name
  type                   = "Block"
  source                 = "C:/Users/yogesh.ashok.shinde/Documents/azureTerraform/modulesDemo/modules/storageaccount/Demo.zip"
}