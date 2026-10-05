resource "azuread_group" "platform_engineers" {
  display_name     = "grp-leke-platform-engineers"
  security_enabled = true
}

resource "azuread_group" "platform_readers" {
  display_name     = "grp-leke-platform-readers"
  security_enabled = true
}

# ------------------------------------------------------------------
# Terraform deployment identity
# ------------------------------------------------------------------

resource "azuread_application" "terraform_deployment" {
  display_name = "app-leke-terraform-deployment-dev"
}

resource "azuread_service_principal" "terraform_deployment" {
  client_id = azuread_application.terraform_deployment.client_id
}