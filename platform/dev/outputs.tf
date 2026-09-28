output "vending_vnet_id" {
  value = data.terraform_remote_state.vending.outputs.vnet_id
}

output "vending_databricks_public_subnet_id" {
  value = data.terraform_remote_state.vending.outputs.databricks_public_subnet_id
}

output "vending_databricks_private_subnet_id" {
  value = data.terraform_remote_state.vending.outputs.databricks_private_subnet_id
}

output "vending_data_platform_resource_group_name" {
  value = data.terraform_remote_state.vending.outputs.data_platform_resource_group_name
}

