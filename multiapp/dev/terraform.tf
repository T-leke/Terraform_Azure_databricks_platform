terraform {
  cloud {
    organization = "learn-terraform-ogidan"

    workspaces {
      name = "dbx-lab-multiapp-dev"
    }
  }

  required_version = ">= 1.16.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }
}