resource "databricks_catalog" "sales" {
  name    = "cat-sales"
  comment = "Governance boundary for the Sales Analytics application"
}