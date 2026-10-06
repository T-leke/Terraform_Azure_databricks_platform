resource "databricks_storage_credential" "data_lake" {
  name = "cred-leke-data-uks-dev"

  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.this.id
  }

  comment = "Managed identity credential for Leke DEV data lake - managed by Terraform"
}