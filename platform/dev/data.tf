data "terraform_remote_state" "vending" {
  backend = "remote"

  config = {
    organization = "learn-terraform-ogidan"

    workspaces = {
      name = "dbx-lab-vending-dev"
    }
  }
}