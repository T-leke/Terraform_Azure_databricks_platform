resource "azurerm_databricks_access_connector" "this" {
  name                = "ac-leke-databricks-uks-dev"
  resource_group_name = data.terraform_remote_state.vending.outputs.data_platform_resource_group_name
  location            = "uksouth"

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
    Project     = "enterprise-databricks-lab"
    ManagedBy   = "terraform"
    Owner       = "platform-engineering"
  }
}

resource "azurerm_role_assignment" "access_connector_storage" {
  scope                = azurerm_storage_account.data_lake.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}