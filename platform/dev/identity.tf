resource "databricks_group" "platform_engineers" {
  display_name = "dbx-platform-engineers"
}

resource "databricks_group_member" "tolu_platform_engineer" {
  group_id  = databricks_group.platform_engineers.id
  member_id = data.databricks_current_user.me.id
}




