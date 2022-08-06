## How to use

```
provider "azurerm" {
features {}
}

module "service-bus-namespace" {
  source  = "spy86/service-bus-namespace/azure"
  version = "1.0.2"
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