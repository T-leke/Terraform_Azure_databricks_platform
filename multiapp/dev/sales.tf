resource "databricks_schema" "bronze" {
  catalog_name = "cat-sales"
  name         = "bronze"
  comment      = "Raw ingestion layer for Sales Analytics"
}

resource "databricks_schema" "silver" {
  catalog_name = "cat-sales"
  name         = "silver"
  comment      = "Validated and transformed layer for Sales Analytics"
}

resource "databricks_schema" "gold" {
  catalog_name = "cat-sales"
  name         = "gold"
  comment      = "Curated consumption layer for Sales Analytics"
}