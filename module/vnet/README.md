# Azure Virtual Network Module

This Terraform module creates an Azure Virtual Network and outputs its name and ID.

# Call  in root module

To use this module, include the following in your Terraform  Root module configuration:


module "vnet" {
  source = "./module/vnet"

  vnet_resource_group_name     = "sampleresourcegroup" #  All these attributes in vnet module can change to desired values
  vnet_resource_group_location = "westus2"
  vnet_name                    = "samplevnet"
  vnet_address_space           = ["10.0.0.0/16"]
}


# Inputs

Name: vnet_resource_group_name
Description : The name of the resource group where the Virtual Network will be created.
Type: string
Default: "sampleresourcegroup"
Required: No

Name : vnet_resource_group_location
description : The location of the resource group.
Type: string
Default: "westus2"
Required: No

Name : vnet_name
Description: The name of the virtual network.
Type: string
Default: "samplevnet"
Required: No

Name: vnet_address_space
Description: : The address space for the virtual network.
Type: list(string)
Default: ["10.0.0.0/16"]
Required: No


# Outputs
module_vnet_name: The name of the created virtual network.
module_vnet_id: The ID of the created virtual network.