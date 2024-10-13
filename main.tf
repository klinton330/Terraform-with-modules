provider "genesyscloud" {
  oauthclient_id = var.oauthclient_id
  oauthclient_secret = var.oauthclient_secret
  aws_region = var.aws_region
}

terraform {
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
module "datatable"{
source=".//modules//datatable"
}

module "Queues"{
source=".//modules//Queues"
}
module "userprompt"{
source=".//modules//userprompt"

}

resource "genesyscloud_flow" "INBOUNDCALL_TestTerraform" {
  depends_on        = [module.datatable, module.Queues,module.userprompt]
  file_content_hash = "${filesha256(var.inboundcallflow_dir)}"
  filepath          = "${var.inboundcallflow_dir}"
}
