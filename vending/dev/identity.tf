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


resource "azuread_application_federated_identity_credential" "github_dev" {
  application_id = azuread_application.terraform_deployment.id
  display_name   = "github-dev"

  audiences = [
    "api://AzureADTokenExchange"
  ]

  issuer = "https://token.actions.githubusercontent.com"

  subject = "repo:T-leke@126075618/Terraform_Azure_databricks_platform@1373689046:environment:dev"
}