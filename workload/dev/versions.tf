terraform {
  required_version = ">= 1.16.0"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }

  cloud {
    organization = "learn-terraform-ogidan"

    workspaces {
      name = "dbx-lab-workload-dev"
    }
  }
}