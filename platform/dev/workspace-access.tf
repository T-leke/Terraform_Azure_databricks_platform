resource "databricks_permission_assignment" "governance" {
  service_principal_name = "e6fcf18b-9ddb-40cd-9cc3-abe13fa6a084"

  permissions = ["USER"]
}

resource "databricks_permission_assignment" "sales_runtime" {
  service_principal_name = data.terraform_remote_state.vending.outputs.sales_runtime_client_id

  permissions = ["USER"]
}


resource "databricks_access_control_rule_set" "sales_runtime" {
  provider = databricks.account

  name = "accounts/${var.databricks_account_id}/servicePrincipals/${data.terraform_remote_state.vending.outputs.sales_runtime_client_id}/ruleSets/default"

  grant_rules {
    principals = [
      "servicePrincipals/${data.terraform_remote_state.vending.outputs.multiapp_deployment_client_id}"
    ]

    role = "roles/servicePrincipal.user"
  }
}