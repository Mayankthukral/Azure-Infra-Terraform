# Azure Resource Group Module

This Terraform module creates an Azure Resource Group and outputs its ID, location, and name.

# Usage

To use this module, include the following in your Terraform configuration:



module "resourcegroup" {
  source = "./module/resourcegroup"

# these attributes can have desirable custom values 

  resource_group_name = "sample"
  resource_group_location = "westus2"
}

# Inputs

Name : resource_group_name
Description: The name of the resource group.
Type: string
Default: "sample"

Name : resource_group_location
Description: The location of the resource group.
Type: string
Default: "westus2"


# Outputs
Name : inmodule_resource_group_id
Description: The ID of the created resource group.
Sensitive: Yes

Name : inmodule_resource_group_location
Description: The location of the created resource group.

Name :inmodule_resource_group_name
Description: The name of the created resource group.