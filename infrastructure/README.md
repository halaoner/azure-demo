# Project Structure

Structure of the `infrastructure/` directory:

```bash
├── README.md
├── LICENSE.md
├── TEST-RESULTS.md
├── examples
│   └──  README.md
├── modules
│   ├── compute
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── data.tf
│   │   └── variables.tf
│   ├── management
│   │   ├── README.md
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── providers.tf
│   │   ├── data.tf
│   │   └── variables.tf
│   └── network
│       ├── README.md
│       ├── main.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── data.tf
│       └── variables.tf
├── prod
│   ├── README.md
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── backend.tf
│   └── versions.tf
├── qa
│   ├── README.md
│   ├── main.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── backend.tf
│   └── versions.tf
└── dev
    ├── README.md
    ├── main.tf
    ├── providers.tf
    ├── variables.tf
    ├── backend.tf
    └── versions.tf
```

# Prerequisites

1. Azure CLI

2. Credentials to authenticate against Azure exist

> 💡 All prerequisites can be found [here](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build#prerequisites). 💡


# Initial `terraform` Commands

1. Initialize terraform working directory

```bash
terraform init
```

2. Format terraform code

```bash
terraform fmt
```

3. Validate terraform code

```bash
terraform validate
```

4. Display the infrastructure that will be provisoned

```bash
# navigate to `devops-interview-45128-oh/infrastructure/qa` directory
terraform plan -var="env_name=qa"
```

5. Deploy infrastructure

```bash
# navigate to `devops-interview-45128-oh/infrastructure/qa` directory
# pass 'env_name' variable with value 'qa'
# deployment will provision terraform resources to the 'qa environment'
terraform apply -var="env_name=qa"

# Use with caution
terraform apply -var="env_name=qa" -auto-approve
```

6. Destroy infrastructure

```bash
terraform destroy -var="env_name=qa"
```

# Terraform Tips

## 1. pre-commit hooks
- **infracost breakdown** --> estimated costs
- **checkov** --> static code analysis
- **terraform_docs** --> auto-generated Terraform documentation
- **terraform_tflint** --> enforce best practices, naming convetions, find errors
- etc.

> 💡 Terraform specific [pre-commit hooks](https://github.com/antonbabenko/pre-commit-terraform). 💡

## 2. Terraform Remote State
- Use [azurerm backend](https://developer.hashicorp.com/terraform/language/backend/azurerm) for storing state of the infrastructure (HIGHLY RECOMMENDED)


## 3. Managinng Multiple Environments

1. Terraform Workspaces
1. Environment-specific directories
1. Third-party tools (for example, Terragrunt)
1. Git branches (for example: dev, qa, prod)

> 💡 [How to Manage Multiple Terraform Environments Efficiently](https://spacelift.io/blog/terraform-environments). 💡
>
> 💡 [Terraform manage multiple environments](https://medium.com/@b0ld8/terraform-manage-multiple-environments-63939f41c454). 💡

## 4. Do Not Commit to `master/ main` Branch
- Do not directly commit to `master/ main` branch - always via Pull Request
- [Protect](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches/about-protected-branches) `master/ main` branch

### Examples of General Git Best Practices
- [Digitally sign commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits)
- Disable force push (to the stable branches, for example, `master/main`)
- Adopt [Git workflow](https://www.atlassian.com/git/tutorials/comparing-workflows)
- Make small changes/ atomic commits
- Use descriptive commit messages
- Enforce code reviews
- Squash commits (when necessary)

