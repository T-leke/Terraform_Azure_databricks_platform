# Platform engineers can inspect the shared foundation,
# but they do not own it.
resource "azurerm_role_assignment" "platform_engineers_shared_reader" {
  scope                = azurerm_resource_group.shared.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.platform_engineers.object_id
}

# Platform engineers can build/manage resources in the
# Data Platform resource group.
resource "azurerm_role_assignment" "platform_engineers_data_platform_contributor" {
  scope                = azurerm_resource_group.data_platform.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.platform_engineers.object_id
}

# Platform readers can inspect the Data Platform but not modify it.
resource "azurerm_role_assignment" "platform_readers_data_platform_reader" {
  scope                = azurerm_resource_group.data_platform.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.platform_readers.object_id
}