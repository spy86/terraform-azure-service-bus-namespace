<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_servicebus_namespace.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/servicebus_namespace) | resource |
| [azurerm_servicebus_namespace_authorization_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/resources/servicebus_namespace_authorization_rule) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/client_config) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.3.0/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A mapping of tags to assign to the resource. | `map` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Var used for backend container name key | `string` | `"dev"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region in which resources are deployed | `string` | `"weu"` | no |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location/region where the storage account is created. Changing this forces a new resource to be created. | `string` | `"West Europe"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the storage account. | `string` | n/a | yes |
| <a name="input_servicebus_namespace_authorization_rule_listen"></a> [servicebus\_namespace\_authorization\_rule\_listen](#input\_servicebus\_namespace\_authorization\_rule\_listen) | Grants listen access to this this Authorization Rule. Defaults to false. | `string` | `"true"` | no |
| <a name="input_servicebus_namespace_authorization_rule_manage"></a> [servicebus\_namespace\_authorization\_rule\_manage](#input\_servicebus\_namespace\_authorization\_rule\_manage) | Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false. | `string` | `"false"` | no |
| <a name="input_servicebus_namespace_authorization_rule_send"></a> [servicebus\_namespace\_authorization\_rule\_send](#input\_servicebus\_namespace\_authorization\_rule\_send) | Grants send access to this this Authorization Rule. Defaults to false | `string` | `"true"` | no |
| <a name="input_servicebus_namespace_capacity"></a> [servicebus\_namespace\_capacity](#input\_servicebus\_namespace\_capacity) | Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only. | `number` | `0` | no |
| <a name="input_servicebus_namespace_name"></a> [servicebus\_namespace\_name](#input\_servicebus\_namespace\_name) | Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_servicebus_namespace_sku"></a> [servicebus\_namespace\_sku](#input\_servicebus\_namespace\_sku) | Defines which tier to use. Options are Basic, Standard or Premium. Please note that setting this field to Premium will force the creation of a new resource. | `string` | `"Basic"` | no |
| <a name="input_servicebus_redundency"></a> [servicebus\_redundency](#input\_servicebus\_redundency) | Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false. | `string` | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created. |
| <a name="output_primary_send_and_listen_connection_string"></a> [primary\_send\_and\_listen\_connection\_string](#output\_primary\_send\_and\_listen\_connection\_string) | The Primary Connection String for the ServiceBus Namespace authorization Rule. |
| <a name="output_primary_send_and_listen_shared_access_key"></a> [primary\_send\_and\_listen\_shared\_access\_key](#output\_primary\_send\_and\_listen\_shared\_access\_key) | The Primary Key for the ServiceBus Namespace authorization Rule. |
| <a name="output_secondary_send_and_listen_connection_string"></a> [secondary\_send\_and\_listen\_connection\_string](#output\_secondary\_send\_and\_listen\_connection\_string) | The Secondary Connection String for the ServiceBus Namespace authorization Rule. |
| <a name="output_secondary_send_and_listen_shared_access_key"></a> [secondary\_send\_and\_listen\_shared\_access\_key](#output\_secondary\_send\_and\_listen\_shared\_access\_key) | The Secondary Key for the ServiceBus Namespace authorization Rule. |
| <a name="output_sku"></a> [sku](#output\_sku) | Defines which tier to use. |
<!-- END_TF_DOCS -->

## How to use

```
module "service-bus-namespace" {
  source  = "spy86/service-bus-namespace/azure"
  version = "1.0.1"
  resource_group_name = "weu-test-rg"
  servicebus_namespace_name = "c803dd50"
  environment = "dev"
  region = "weu"
  resource_group_location= "West Europe"
  servicebus_namespace_authorization_rule_listen = "true"
  servicebus_namespace_authorization_rule_manage = "false"
  servicebus_namespace_authorization_rule_send = "true"
  servicebus_namespace_capacity = "0"
  servicebus_namespace_sku = "Basic"
  servicebus_redundency = "false"

  default_tags = {
      Administrator = "Someone"
      Department = "IT"
      CostCentre = "ABC123"
      ContactPerson = "Someone@example.com"
      ManagedByTerraform = "True"
}
}
```