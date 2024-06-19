variable "resource_group_name" {
  type = string
  default = "sampleresourcegroup"
}

variable "virtual_network_name" {
    type = string
    default = "samplevnet"
}

variable "subnets" {
  type = map(object({
    address_prefix     = string
    name               = string
  }))

  default = {
    subnet1 = {
      address_prefix = "10.0.1.0/24"
      name           = "VM_scaleset_subnet"
    }
    subnet2 = {
      address_prefix = "10.0.2.0/24"
      name           = "app_gateway_subnet"
    }
  }
}
