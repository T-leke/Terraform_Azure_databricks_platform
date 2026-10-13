resource "databricks_catalog" "sales" {
  name = "cat-sales"

  storage_root = "${data.terraform_remote_state.platform.outputs.managed_storage_url}catalogs/sales"

  comment = "Governance boundary for the Sales Analytics application"
}