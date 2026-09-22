terraform {
  required_version = ">= 1.16.0"

  cloud {
    organization = "learn-terraform-ogidan"

    workspaces {
      name = "dbx-lab-vending-dev"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}