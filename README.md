# Terraform Ansible Demo

## Prerequisites

1. AAP (Ansible Automation Platform) instance
2. Terraform workspace created

## Configuration

This project has been linked to a Terraform workspace with the following variables configured at the workspace level:

- `aap_hostname`: The hostname of your Ansible Automation Platform instance
- `aap_password`: The password for your AAP instance
- `aap_username`: The username for your AAP instance
- `ssh_public_key`: SSH public key used to access the EC2 instance created in AWS

## Ansible Automation Platform Setup

**Note:** Adhering to the exact names is crucial, as the `Inventory` references these resources by their names.

### 1. Create Project

- **Name:** `Webserver`
- **Git URL:** `https://github.com/colintkn/terraform-ansible-demo.git`

### 2. Create Machine Credential

Create a machine credential with a private key that is able to access the EC2 instance created.

### 3. Create Job Template

- **Name:** `Install Webserver`
