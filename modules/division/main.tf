terraform {
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
resource "genesyscloud_auth_division" "Home" {
  name = "Home"
  home = true
}

