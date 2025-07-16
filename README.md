# Terraform GitHub Repository Automation

This project uses Terraform to create and configure a GitHub repository by provisioining admin access through a github personal access token.

## Setup

1. **Install Terraform**

   [Download Terraform](https://developer.hashicorp.com/terraform/install#linux)

2. **Export your GitHub token**

   ``` bash
   export TF_VAR_github_token=ghp_your_personal_access_token
   ```

3. **Change Variables**
    - Feel free to change values of any variables in the terraform.tfvars:
    ```
    repo_name        = "my-terraform-practice-repo"
    repo_description = "This repo was created by Terraform and Daniel Munoz :)"
    repo_visibility  = "public"
    has_issues       = false
    has_wiki         = false
    auto_init        = true

3. **Terraform Commands**

    ```
    terraform init
    ```

    ```
    terraform plan
    ```
    ```
    terraform apply
    ```

#### Thanks for reading :)
