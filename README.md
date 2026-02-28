# CST8918 – Lab A05: Terraform Web Server on Azure

## Overview

This lab demonstrates how to use **Terraform** to deploy a simple Ubuntu web server on **Microsoft Azure** using Infrastructure as Code (IaC).

The solution provisions a complete Azure infrastructure environment including networking, security, and a Linux virtual machine configured with Apache via cloud-init.

---

## Architecture

The following resources are deployed:

- Azure Resource Group
- Virtual Network (10.0.0.0/16)
- Subnet (10.0.1.0/24)
- Network Security Group (Allow SSH & HTTP)
- Public IP Address
- Network Interface
- Ubuntu 22.04 Linux Virtual Machine
- Apache Web Server (installed automatically)

Architecture diagram:

![Architecture](/a05-architecture.png)

---

## Technologies Used

- Terraform
- Azure CLI
- AzureRM Provider
- Cloud-Init
- Ubuntu 22.04 LTS
- Apache2

---

## Deployment Steps

### 1. Initialize Terraform

```bash
terraform init
```

### 2. Apply Configuration

```
terraform apply
```

When prompted, enter your college username as the labelPrefix.

### 3. Access the Web Server

After deployment:

- Open browser: 

```
http://<public_ip_address>
```

- SSH into VM:

```
ssh azureadmin@<public_ip_address>
```

---

## Demo

The deployment and verification are shown below:

![Deployment Demo](/a05-demo.png)

---

## Cleanup

To remove all resources:

```
terraform destroy
```

---

## Notes

- Azure policy restrictions required selecting an approved VM size.
- RSA SSH key was used for compatibility with Azure policy.
- Terraform state files are excluded from version control.
