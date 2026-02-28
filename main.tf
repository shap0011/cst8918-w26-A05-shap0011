# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }
}

# Define providers and their config params
provider "azurerm" {
  # Leave the features block empty to accept all defaults
  features {}
}

provider "cloudinit" {
  # Configuration options
}

# -------------------------
# Variables
# -------------------------

variable "labelPrefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "region" {
  description = "Azure region for deployment"
  type        = string
  default     = "Canada Central"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureadmin"
}

# -------------------------
# Resource Group
# -------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${var.labelPrefix}-A05-RG"
  location = var.region
}

# -------------------------
# Public IP Address
# -------------------------
resource "azurerm_public_ip" "pip" {
  name                = "${var.labelPrefix}-A05-PIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  allocation_method = "Static"
  sku               = "Standard"
}
