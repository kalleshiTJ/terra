provider "azurerm" {

  features {}

}




resource "azurerm_resource_group" "example" {

  name = "rg-01"

  location = "West Europe"

}




resource "azurerm_service_plan" "example" {

  name = "example-app-service-plan"

  location = azurerm_resource_group.example.location

  resource_group_name = azurerm_resource_group.example.name

  sku_name = "S1"

  os_type = "Windows"

}




resource "azurerm_app_service" "example" {

  name = "web-application-01"

  location = azurerm_resource_group.example.location

  resource_group_name = azurerm_resource_group.example.name

  app_service_plan_id = azurerm_service_plan.example.id



  site_config {

    always_on = true

    app_command_line = ""

    dotnet_framework_version = "v5.0"

    scm_type = "None"

  }

}