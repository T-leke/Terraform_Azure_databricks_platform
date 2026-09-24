resource "azuread_group" "platform_engineers" {
  display_name     = "grp-leke-platform-engineers"
  security_enabled = true
}

resource "azuread_group" "platform_readers" {
  display_name     = "grp-leke-platform-readers"
  security_enabled = true
}

data "azuread_user" "tolu" {
  user_principal_name = "tolu@gbemilekeogidanoutlook.onmicrosoft.com"
}

resource "azuread_group_member" "tolu_platform_reader" {
  group_object_id  = azuread_group.platform_readers.object_id
  member_object_id = data.azuread_user.tolu.object_id
}