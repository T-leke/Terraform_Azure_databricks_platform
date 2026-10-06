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


resource "azuread_application_federated_identity_credential" "github_dev_immutable" {
  application_id = azuread_application.terraform_deployment.id
  display_name   = "github-dev-immutable"

  audiences = [
    "api://AzureADTokenExchange"
  ]

  issuer = "https://token.actions.githubusercontent.com"

  subject = "repo:T-leke@126075618/Terraform_Azure_databricks_platform@1373689046:environment:dev"
}

data "azuread_service_principal" "microsoft_graph" {
  client_id = "00000003-0000-0000-c000-000000000000"
}

resource "azuread_app_role_assignment" "terraform_group_management" {
  app_role_id         = data.azuread_service_principal.microsoft_graph.app_role_ids["Group.ReadWrite.All"]
  principal_object_id = azuread_service_principal.terraform_deployment.object_id
  resource_object_id  = data.azuread_service_principal.microsoft_graph.object_id
}

resource "azuread_app_role_assignment" "terraform_application_read" {
  app_role_id         = data.azuread_service_principal.microsoft_graph.app_role_ids["Application.Read.All"]
  principal_object_id = azuread_service_principal.terraform_deployment.object_id
  resource_object_id  = data.azuread_service_principal.microsoft_graph.object_id
}

resource "azuread_application" "platform_deployment" {
  display_name = "app-leke-platform-deployment-dev"
}

resource "azuread_service_principal" "platform_deployment" {
  client_id = azuread_application.platform_deployment.client_id
}

resource "azuread_application_federated_identity_credential" "github_platform_dev" {
  application_id = azuread_application.platform_deployment.id
  display_name   = "github-platform-dev"

  audiences = [
    "api://AzureADTokenExchange"
  ]

  issuer = "https://token.actions.githubusercontent.com"

  subject = "repo:T-leke@126075618/Terraform_Azure_databricks_platform@1373689046:environment:dev"
}