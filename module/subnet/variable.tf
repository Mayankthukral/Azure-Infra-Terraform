variable "resource_group_name" {
  type = string
  default = "sampleresourcegroup"
}

variable "virtual_network_name" {
    type = string
    default = "samplevnet"
}

variable "subnet_name" {
    type = string
    default = "sampleSubnet"
}

variable "address_prefixes" {
    default = ["10.0.0.0/16"]
}