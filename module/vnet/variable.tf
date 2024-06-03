variable "vnet_resource_group_name" {
    type = string
    default = "sampleresourcegroup"
  
}
variable "vnet_resource_group_location" {
    type = string
    default = "westus2"
  
}

variable "vnet_name" {
    type = string 
    default = "samplevnet"  
}

variable "vnet_address_space" {
    default = ["10.0.0.0/16"]
  
}