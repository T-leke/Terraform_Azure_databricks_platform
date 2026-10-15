provider "databricks" {
  host = data.terraform_remote_state.platform.outputs.databricks_workspace_url
}