###########################
# Common vars
###########################
variable "environment" {
  description = "Var used for backend container name key"
  type = string
  default = "dev"
}
variable "default_tags" {
  description = "A mapping of tags to assign to the resource."
  type = map
}
variable "region" {
  description = "Region in which resources are deployed"
  type = string
  default = "weu"
}
###########################
# Resource groups vars
###########################
variable "resource_group_location" {
  description = "The location/region where the storage account is created. Changing this forces a new resource to be created."
  default = "West Europe"
  type = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type = string
}
###########################
# Service Bus groups vars
###########################
variable "servicebus_namespace_name" {
  description = "Specifies the name of the ServiceBus Namespace resource . Changing this forces a new resource to be created."
  type = string
}
variable "servicebus_namespace_sku" {
  description = "Defines which tier to use. Options are Basic, Standard or Premium. Please note that setting this field to Premium will force the creation of a new resource."
  default = "Basic"
  type = string
}
variable "servicebus_namespace_capacity" {
  description = "Specifies the capacity. When sku is Premium, capacity can be 1, 2, 4, 8 or 16. When sku is Basic or Standard, capacity can be 0 only."
  default = 0
  type = number
}
variable "servicebus_redundency" {
  description = "Whether or not this resource is zone redundant. sku needs to be Premium. Defaults to false."
  default = "false"
  type = string
}
variable "servicebus_namespace_authorization_rule_listen" {
  description = "Grants listen access to this this Authorization Rule. Defaults to false."
  default = "true"
  type = string
}
variable "servicebus_namespace_authorization_rule_send" {
  description = "Grants send access to this this Authorization Rule. Defaults to false"
  default = "true"
  type = string
}
variable "servicebus_namespace_authorization_rule_manage" {
  description = "Grants manage access to this this Authorization Rule. When this property is true - both listen and send must be too. Defaults to false."
  default = "false"
  type = string
}


 