resource "databricks_grant" "bronze_platform_engineers" {
  schema    = databricks_schema.bronze.id
  principal = "grp-leke-platform-engineers"

  privileges = [
    "USE_SCHEMA"
  ]
}

resource "databricks_grant" "silver_platform_engineers" {
  schema    = databricks_schema.silver.id
  principal = "grp-leke-platform-engineers"

  privileges = [
    "USE_SCHEMA"
  ]
}

resource "databricks_grant" "gold_platform_engineers" {
  schema    = databricks_schema.gold.id
  principal = "grp-leke-platform-engineers"

  privileges = [
    "USE_SCHEMA"
  ]
}

resource "databricks_grant" "bronze_sales_runtime" {
  schema    = databricks_schema.bronze.id
  principal = data.terraform_remote_state.platform.outputs.sales_runtime_client_id

  privileges = [
    "USE_SCHEMA",
    "CREATE_TABLE"
  ]
}

resource "databricks_grant" "silver_sales_runtime" {
  schema    = databricks_schema.silver.id
  principal = data.terraform_remote_state.platform.outputs.sales_runtime_client_id

  privileges = [
    "USE_SCHEMA",
    "CREATE_TABLE"
  ]
}

resource "databricks_grant" "gold_sales_runtime" {
  schema    = databricks_schema.gold.id
  principal = data.terraform_remote_state.platform.outputs.sales_runtime_client_id

  privileges = [
    "USE_SCHEMA",
    "CREATE_TABLE"
  ]
}
