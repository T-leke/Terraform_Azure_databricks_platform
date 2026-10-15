provider "azurerm" {
  features {}
}

# Workspace-level Databricks provider
provider "databricks" {
  host                        = "https://${azurerm_databricks_workspace.this.workspace_url}"
  azure_workspace_resource_id = azurerm_databricks_workspace.this.id
  auth_type                   = "azure-cli"
}

# Account-level Databricks provider
provider "databricks" {
  alias      = "account"
  host       = "https://accounts.azuredatabricks.net"
  account_id = var.databricks_account_id
  auth_type  = "azure-cli"
}