resource "databricks_storage_credential" "data_lake" {
  name = "cred-leke-data-uks-dev"

  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.this.id
  }

  comment = "Managed identity credential for Leke DEV data lake - managed by Terraform"
}


resource "databricks_external_location" "landing" {
  name = "ext-leke-landing-dev"

  url = "abfss://${azurerm_storage_container.landing.name}@${azurerm_storage_account.data_lake.name}.dfs.core.windows.net/"

  credential_name = databricks_storage_credential.data_lake.name

  comment = "Landing area for DEV data ingestion - managed by Terraform"
}

resource "databricks_external_location" "managed" {
  name = "ext-leke-managed-dev"

  url = "abfss://${azurerm_storage_container.managed.name}@${azurerm_storage_account.data_lake.name}.dfs.core.windows.net/"

  credential_name = databricks_storage_credential.data_lake.name

  comment = "External location for Unity Catalog managed storage"
}

resource "databricks_grant" "governance_managed_storage" {
  external_location = databricks_external_location.managed.id

  principal = "e6fcf18b-9ddb-40cd-9cc3-abe13fa6a084"

  privileges = [
    "CREATE_MANAGED_STORAGE"
  ]
}