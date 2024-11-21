<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.web_app](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The application name | `string` | `"vent4cloud"` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | The environment name (mandatory) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region for resources | `string` | `"Central US"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | `"devops-interview"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resouce_group_name"></a> [resouce\_group\_name](#output\_resouce\_group\_name) | Name of the resource group |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Region of the resource group |
<!-- END_TF_DOCS -->