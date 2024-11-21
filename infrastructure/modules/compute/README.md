<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.backend_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_linux_virtual_machine.worker_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | The application name | `string` | `"vent4cloud"` | no |
| <a name="input_backend_nic"></a> [backend\_nic](#input\_backend\_nic) | Backend network interface | `any` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | The environment name (mandatory) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region for resources | `string` | `"Central US"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_worker_nic"></a> [worker\_nic](#input\_worker\_nic) | Worker network interface | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->