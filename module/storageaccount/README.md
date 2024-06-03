# Azure Storage Account Module

This Terraform module creates an Azure Storage Account and outputs its name and ID.

## Usage

To use this module, include the following in your Terraform configuration:

module "storage_account" {
  source = "./path/to/this/module"

# following attributes can have cutom values
  storage_resourcegroup_name = "sampleresourcegroup" 
  storage_resourcegroup_location = "westus2"
  storage_account_name = "sample_storage_account_name"
  storage_account_account_tier = "Standard"
}

# Inputs

Name : storage_resourcegroup_name
Description: The name of the resource group where the Storage Account will be created.
Type: string
Default: "sampleresourcegroup"
Required: No

Name :storage_resourcegroup_location
Description: The location of the resource group.
Type: string
Default: "westus2"
Required: No

Name :storage_account_name
Description: The name of the storage account. It should be in lowercase and globally unique.
Type: string
Default: "sample_storage_account_name"

Name :storage_account_account_tier
Description: The tier for the storage account.
Type: string
Default: "Standard"

Name :storage_account_replication_type
Description: The replication type for the storage account.
Type: string
Default: "LRS"

# Output

Name :storage_account_name
Description: The name of the created storage account.

Name :storage_account_id
Description: The ID of the created storage account.