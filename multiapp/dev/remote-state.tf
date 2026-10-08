data "terraform_remote_state" "platform" {
  backend = "remote"

  config = {
    organization = "learn-terraform-ogidan"

    workspaces = {
      name = "dbx-lab-platform-dev"
    }
  }
}