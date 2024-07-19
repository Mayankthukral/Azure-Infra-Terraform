# Terraform Infrastructure Configuration for Azure Resources

This Terraform configuration sets up various Azure resources, including VNet, subnets, security groups, and more. It provides a modular approach for managing infrastructure components in Azure.

## Terraform Files

- **main.tf**: Defines the main resources including VNet, subnets, security groups, and other Azure resources.
- **variables.tf**: Contains input variables used in the configuration.
- **outputs.tf**: Defines outputs that are useful for understanding the created infrastructure.
- **provider.tf**: Configures the Azure provider settings.
- **dev.tfvars**: Development environment variables for Terraform.

## Modules

### Application Gateway

- **Module Path**: `module/application_gateway`
- **Resources Created**: Application Gateway related resources.
- **Files**: `main.tf`, `variables.tf`

### Key Vault

- **Module Path**: `module/Key_vault`
- **Resources Created**: Key Vault resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### Load Balancer

- **Module Path**: `module/Load_balancer`
- **Resources Created**: Load Balancer resources.
- **Files**: `main.tf`, `variables.tf`

### Network Interface

- **Module Path**: `module/Network_interface`
- **Resources Created**: Network Interface resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### Network Security Group

- **Module Path**: `module/Network_security_group`
- **Resources Created**: Network Security Group resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### NSG Association NIC

- **Module Path**: `module/nsg_association_nic`
- **Resources Created**: Network Security Group associations with Network Interfaces.
- **Files**: `main.tf`, `variables.tf`

### Recovery Service Vault

- **Module Path**: `module/recovery_service_vault`
- **Resources Created**: Recovery Service Vault resources.
- **Files**: `main.tf`, `variables.tf`

### Resource Group

- **Module Path**: `module/resourcegroup`
- **Resources Created**: Resource Group.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### Storage Account

- **Module Path**: `module/storageaccount`
- **Resources Created**: Storage Account resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### Subnet

- **Module Path**: `module/subnet`
- **Resources Created**: Subnet resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### VM Scale Set

- **Module Path**: `module/VM_Scale_Set`
- **Resources Created**: Virtual Machine Scale Set resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

### VNet

- **Module Path**: `module/vnet`
- **Resources Created**: Virtual Network resources.
- **Files**: `main.tf`, `output.tf`, `variables.tf`

## Usage

1. **Clone the Repository**: Clone this repository containing Terraform configuration files.
   
   ```sh
   git clone https://github.com/Mayankthukral/Azure-Infra-Terraform.git
   cd Azure-Infra-Terraform

2. **Change the variable value in dev.tfvars**: Put the desired value according to the infrastruture .
   

3. **initialize the Project**: Initialize the Terraform project.
   
   ```sh
   terraform init 

4. **Validate the project**: Ensure the configuration is syntactically valid.
   
   ```sh
   terraform validate

4. **Review the Plan"**: Review what Terraform will do before applying changes.
   
   ```sh
   terraform plan -var-file="dev.tfvars" -out="terraform_plan.tfplan"

5. **Apply Reviewed plan**: You can then apply the saved plan using :
   
   ```sh
   terraform apply "terraform_plan.tfplan"



