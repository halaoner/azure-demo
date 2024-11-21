<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.0.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_compute"></a> [compute](#module\_compute) | ../modules/compute | n/a |
| <a name="module_network"></a> [network](#module\_network) | ../modules/network | n/a |
| <a name="module_web_app_resource_group"></a> [web\_app\_resource\_group](#module\_web\_app\_resource\_group) | ../modules/management | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The application name | `string` | `"vent4cloud"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | The environment name (mandatory) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region for resources | `string` | `"Central US"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | `"devops-interview"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->