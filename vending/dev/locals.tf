locals {
  common_tags = {
    Environment = var.environment
    Project     = "enterprise-databricks-lab"
    ManagedBy   = "terraform"
    Owner       = "platform-engineering"
  }
}