resource "databricks_permission_assignment" "governance" {
  service_principal_name = "e6fcf18b-9ddb-40cd-9cc3-abe13fa6a084"

  permissions = ["USER"]
}