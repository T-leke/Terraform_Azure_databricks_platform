resource "azurerm_storage_account" "data_lake" {
  name                     = "stlekedatauksdev"
  resource_group_name      = data.terraform_remote_state.vending.outputs.data_platform_resource_group_name
  location                 = "uksouth"

  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Turns the storage account into ADLS Gen2.
  is_hns_enabled = true

  min_tls_version = "TLS1_2"

  tags = {
    Environment = "dev"
    Project     = "enterprise-databricks-lab"
    ManagedBy   = "terraform"
    Owner       = "platform-engineering"
  }
}