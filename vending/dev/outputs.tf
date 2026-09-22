output "shared_resource_group_name" {
  description = "Shared resource group created by the vending layer."
  value       = azurerm_resource_group.shared.name
}

output "shared_resource_group_id" {
  description = "Azure resource ID of the shared resource group."
  value       = azurerm_resource_group.shared.id
}

output "data_platform_resource_group_name" {
  description = "Resource group allocated to the data platform."
  value       = azurerm_resource_group.data_platform.name
}

output "data_platform_resource_group_id" {
  description = "Azure resource ID of the data platform resource group."
  value       = azurerm_resource_group.data_platform.id
}

output "vnet_id" {
  description = "ID of the development data platform VNet."
  value       = azurerm_virtual_network.data.id
}

output "vnet_name" {
  description = "Name of the development data platform VNet."
  value       = azurerm_virtual_network.data.name
}

output "databricks_public_subnet_id" {
  description = "Subnet ID allocated to the Databricks public/host subnet."
  value       = azurerm_subnet.databricks_public.id
}

output "databricks_private_subnet_id" {
  description = "Subnet ID allocated to the Databricks private/container subnet."
  value       = azurerm_subnet.databricks_private.id
}

output "private_endpoint_subnet_id" {
  description = "Subnet ID allocated to platform private endpoints."
  value       = azurerm_subnet.private_endpoints.id
}

output "databricks_nsg_id" {
  description = "NSG associated with the Databricks VNet injection subnets."
  value       = azurerm_network_security_group.databricks.id
}