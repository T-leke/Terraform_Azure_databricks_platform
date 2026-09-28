resource "azurerm_public_ip" "databricks_nat" {
  name                = "pip-leke-databricks-nat-uks-dev"
  location            = azurerm_resource_group.shared.location
  resource_group_name = azurerm_resource_group.shared.name

  allocation_method = "Static"
  sku               = "Standard"

  tags = {
    Environment = "dev"
    Project     = "enterprise-databricks-lab"
    ManagedBy   = "terraform"
    Owner       = "platform-engineering"
  }
}

resource "azurerm_nat_gateway" "databricks" {
  name                = "nat-leke-databricks-uks-dev"
  location            = azurerm_resource_group.shared.location
  resource_group_name = azurerm_resource_group.shared.name

  sku_name                = "Standard"
  idle_timeout_in_minutes = 10

  tags = {
    Environment = "dev"
    Project     = "enterprise-databricks-lab"
    ManagedBy   = "terraform"
    Owner       = "platform-engineering"
  }
}

resource "azurerm_nat_gateway_public_ip_association" "databricks" {
  nat_gateway_id       = azurerm_nat_gateway.databricks.id
  public_ip_address_id = azurerm_public_ip.databricks_nat.id
}

resource "azurerm_subnet_nat_gateway_association" "databricks_public" {
  subnet_id      = azurerm_subnet.databricks_public.id
  nat_gateway_id = azurerm_nat_gateway.databricks.id
}

resource "azurerm_subnet_nat_gateway_association" "databricks_private" {
  subnet_id      = azurerm_subnet.databricks_private.id
  nat_gateway_id = azurerm_nat_gateway.databricks.id
}