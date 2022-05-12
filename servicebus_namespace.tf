locals {
  auth_rule_name = "SendAndListenSharedAccessKey"
}

resource "azurerm_servicebus_namespace" "main" {
  name                = "${var.environment}-${var.servicebus_namespace_name}-${var.region}-sb-ns"
  location            = "${data.azurerm_resource_group.rg.location}"
  resource_group_name = "${data.azurerm_resource_group.rg.name}"
  sku                 = "${var.servicebus_namespace_sku}"
  zone_redundant      = "${var.servicebus_redundency}"
  capacity            = "${var.servicebus_namespace_capacity}"

  tags = "${var.default_tags}"
}

resource "azurerm_servicebus_namespace_authorization_rule" "main" {
  name         = "${local.auth_rule_name}"
  namespace_id = "${azurerm_servicebus_namespace.main.id}"

  listen = "${var.servicebus_namespace_authorization_rule_listen}"
  send   = "${var.servicebus_namespace_authorization_rule_send}"
  manage = "${var.servicebus_namespace_authorization_rule_manage}"
}