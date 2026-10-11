output "databricks_workspace_url" {
  description = "Databricks workspace URL obtained from Platform state"
  value       = data.terraform_remote_state.platform.outputs.databricks_workspace_url
}