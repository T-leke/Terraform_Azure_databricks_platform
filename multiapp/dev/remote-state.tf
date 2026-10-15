data "terraform_remote_state" "platform" {
  backend = "remote"

  config = {
    organization = "learn-terraform-ogidan"

    workspaces = {
      name = "dbx-lab-platform-dev"
    }
  }
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

data "databricks_node_type" "smallest" {
  local_disk = true
}