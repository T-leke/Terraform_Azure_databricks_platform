resource "databricks_grant" "sales_multiapp" {
  catalog   = databricks_catalog.sales.name
  principal = "d5393d50-607d-4bdb-af49-302a8ded9005"

  privileges = [
    "USE_CATALOG",
    "CREATE_SCHEMA"
  ]
}

resource "databricks_grant" "sales_platform_engineers" {
  catalog   = databricks_catalog.sales.name
  principal = "grp-leke-platform-engineers"

  privileges = [
    "USE_CATALOG"
  ]
}


resource "databricks_grant" "sales_runtime" {
  catalog = databricks_catalog.sales.name

  principal = data.terraform_remote_state.platform.outputs.sales_runtime_client_id

  privileges = [
    "USE_CATALOG"
  ]
}