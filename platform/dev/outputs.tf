output "vending_vnet_id" {
  value = data.terraform_remote_state.vending.outputs.vnet_id
}

output "vending_databricks_public_subnet_id" {
  value = data.terraform_remote_state.vending.outputs.databricks_public_subnet_id
}

output "vending_databricks_private_subnet_id" {
  value = data.terraform_remote_state.vending.outputs.databricks_private_subnet_id
}

output "vending_data_platform_resource_group_name" {
  value = data.terraform_remote_state.vending.outputs.data_platform_resource_group_name
}


output "databricks_workspace_url" {
  description = "URL of the Databricks workspace for downstream deployments"
  value       = azurerm_databricks_workspace.this.workspace_url
}

output "managed_storage_url" {
  description = "ADLS path for Unity Catalog managed storage"
  value       = "abfss://${azurerm_storage_container.managed.name}@${azurerm_storage_account.data_lake.name}.dfs.core.windows.net/"
}

output "sales_runtime_client_id" {
  description = "Client ID of the Sales Analytics runtime service principal"
  value       = data.terraform_remote_state.vending.outputs.sales_runtime_client_id
}