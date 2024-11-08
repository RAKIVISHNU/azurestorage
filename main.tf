variable azurerm_resource_group_name {
type = string
}
variable azurerm_resource_group_location {
type = string
}
resource "azurerm_storage_account" "myStorage" {
name = "vishnu03030"
resource_group_name = var.azurerm_resource_group_name
location = var.azurerm_resource_group_location
account_tier = "Standard"
account_replication_type = "GRS"
}
output storage_replication {
value = azurerm_storage_account.myStorage.account_replication_type
}