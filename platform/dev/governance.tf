# Discover the existing metastore attached to our workspace
data "databricks_current_metastore" "this" {}

# Grant the Multiapp deployment identity permission to create catalogs
resource "databricks_grant" "multiapp_create_catalog" {
  metastore = data.databricks_current_metastore.this.id

  principal  = "d5393d50-607d-4bdb-af49-302a8ded9005"
  privileges = ["CREATE_CATALOG"]
}