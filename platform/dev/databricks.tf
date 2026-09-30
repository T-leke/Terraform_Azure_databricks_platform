resource "azurerm_databricks_workspace" "this" {
  name                = "dbw-leke-data-uks-dev"
  resource_group_name = data.terraform_remote_state.vending.outputs.data_platform_resource_group_name
  location            = "uksouth"
  sku                 = "premium"

  managed_resource_group_name = "rg-leke-databricks-managed-uks-dev"

  custom_parameters {
    virtual_network_id = data.terraform_remote_state.vending.outputs.vnet_id

    public_subnet_name = data.terraform_remote_state.vending.outputs.databricks_public_subnet_name

    private_subnet_name = data.terraform_remote_state.vending.outputs.databricks_private_subnet_name

    public_subnet_network_security_group_association_id = data.terraform_remote_state.vending.outputs.databricks_public_nsg_association_id

    private_subnet_network_security_group_association_id = data.terraform_remote_state.vending.outputs.databricks_private_nsg_association_id

    no_public_ip = true
  }

  tags = {
    Environment = "dev"
    Project     = "enterprise-databricks-lab"
    ManagedBy   = "terraform"
    Owner       = "platform-engineering"
  }
}

