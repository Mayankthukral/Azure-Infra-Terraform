variable "storage_resourcegroup_name" {
    type = string
    default = "sampleresourcegroup"
}

variable "storage_resourcegroup_location" {
    type = string
    default = "westus2"
  
}

variable "storage_account_name" {
    type = string
    default = "sample_storage_account_name"
  
}

variable "storage_account_account_tier" {
    default = "Standard"
  
}

variable "storage_account_replication_type"{
    default = "LRS"
}