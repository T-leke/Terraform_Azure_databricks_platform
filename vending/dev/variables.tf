variable "location" {
  description = "Primary Azure region for the development landing zone."
  type        = string
  default     = "uksouth"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Short name used for lab resources."
  type        = string
  default     = "leke"
}

variable "vnet_address_space" {
  description = "Address space allocated to the development data platform VNet."
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "databricks_public_subnet_cidr" {
  description = "CIDR allocated to the Databricks public/host subnet."
  type        = string
  default     = "10.20.1.0/24"
}

variable "databricks_private_subnet_cidr" {
  description = "CIDR allocated to the Databricks private/container subnet."
  type        = string
  default     = "10.20.2.0/24"
}

variable "private_endpoint_subnet_cidr" {
  description = "CIDR allocated to private endpoints."
  type        = string
  default     = "10.20.3.0/24"
}