variable "VM_scale_set_name" {
  default = "Sample_Scale_set"
}

variable "VM_scale_set_resourcegroup" {
  default = "sampleresourcegroup"
}

variable "VM_scale_set_location" {
  default = "uswest2"
}

variable "VM_scale_set_sshkey" {
  
}

variable "admin_ssh_key_name" {
  default = "myAdmin"
}

variable "VM_scale_set_ip_subnet" {
    default = "samplesubnet"
  
}

variable "VM_scale_set_autoscale_setting_name" {
  default = "sample_autoscalesetting"
}

variable "VM_scale_set_autoscale_setting_resourcegroup_name" {
  default = "sampleresourcegroup"
}

variable "VM_scale_set_autoscale_setting_resourcegroup_location" {
  default = "uswest2"
}

variable "VM_scale_set_autoscale_setting_target_resource_id" {
  
}

variable "autoscale_vm_initial_count" {
    default = "1"
}

variable "autoscale_vm_minimum_count" {
    default = "2"
  
}
variable "autoscale_vm_maximum_count" {
  default = "10"
}

variable "autoscale_rule_Increased_CPU_Percentage" {
    default = "75"
    description = "CPU metrics Percentage which triggers rule named as Increased CPU Percentage"
}

variable "autoscale_rule_Increased_CPU_Percentage_additionalVMs" {
  default = "1"
  description = "Number of instances to be increased when cpu threshold increases"
}

variable "autoscale_rule_Increased_CPU_Percentage_cooldownTime" {
  default = "PT5M"
}

variable "autoscale_rule_Decreased_CPU_Percentage" {
  default = "25"
  description =  "CPU metrics Percentage which triggers rule named as Decreased CPU Percentage"
}

variable "autoscale_rule_Decreased_CPU_Percentage_DecreaseCountVMs" {
  default = "1"
}

variable "autoscale_rule_Decreased_CPU_Percentage_cooldownTime" {
  default = "PT5M"
}
