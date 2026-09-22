resource "azuread_group" "platform_engineers" {
  display_name     = "grp-leke-platform-engineers"
  security_enabled = true
}

resource "azuread_group" "platform_readers" {
  display_name     = "grp-leke-platform-readers"
  security_enabled = true
}