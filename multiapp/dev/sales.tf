resource "databricks_catalog" "sales" {
  name    = "cat-sales"
  comment = "Unity Catalog catalog for the Sales Analytics application"
}