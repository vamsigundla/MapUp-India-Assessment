# Terraform Infrastructure Deployment Guide

This guide demonstrates how to use Terraform to deploy a basic infrastructure on AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with necessary access credentials

## Terraform Files Overview

The Terraform configuration is structured as follows:

- `main.tf`: Defines the primary infrastructure components.
- `variables.tf`: Contains variable definitions.
- `outputs.tf`: Specifies outputs to be displayed after applying the configuration.
- `README.md`: Provides instructions and an overview of the configuration.

## Configuration Details

### Terraform Files

#### `main.tf`

This file contains the Terraform code to create:

- VPC (`aws_vpc`)
- Subnet (`aws_subnet`)
- EC2 instance (`aws_instance`)
- Security groups (`aws_security_group`)
- NACL (`aws_network_acl`)
- NAT Gateway (`aws_nat_gateway`)
- Route Table (`aws_route_table`)

#### `variables.tf`

Defines the input variables used in the main configuration files.

#### `outputs.tf`

Specifies the output values that will be displayed after applying the configuration.

### Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/your/repository.git
    ```

2. Navigate to the Terraform configuration directory:

    ```bash
    cd terraform-aws
    ```

3. Initialize Terraform:

    ```bash
    terraform init
    ```

4. Review and modify the `variables.tf` file if needed to set specific values.

5. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

6. Verify the resources created in the AWS Management Console.

7. Clean up resources when done:

    ```bash
    terraform destroy
    ```

## Note

- Always ensure that Terraform configurations are reviewed and validated before applying them to production environments.
- Review AWS permissions and access levels granted to Terraform for resource creation.
