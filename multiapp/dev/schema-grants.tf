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