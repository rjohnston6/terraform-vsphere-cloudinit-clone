# Enter version information for terraform and providers
terraform {
  # Sets minimum required version for Terraform CLI
  required_version = ">=1.1"

  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.1.1"
    }
  }
}


