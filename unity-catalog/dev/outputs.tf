output "databricks_workspace_url" {
  description = "Databricks workspace URL obtained from Platform state"
  value       = data.terraform_remote_state.platform.outputs.databricks_workspace_url
}

output "databricks_authenticated_principal" {
  description = "Principal used by the Governance Databricks provider"
  value       = data.databricks_current_user.governance.user_name
}