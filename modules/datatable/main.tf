terraform {
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
resource "genesyscloud_architect_datatable" "Test_Terraform" {
  name        = "Test_Terraform"
  properties {
    name  = "key"
    title = "Key"
    type  = "string"
  }
  properties {
    title = "Name"
    type  = "string"
    name  = "Name"
  }
  properties {
    title = "Age"
    type  = "integer"
    name  = "Age"
  }
  properties {
    name    = "IsAvailable"
    title   = "IsAvailable"
    type    = "boolean"
    default = "false"
  }
  description = "Datatable for Terraform 1"
}

