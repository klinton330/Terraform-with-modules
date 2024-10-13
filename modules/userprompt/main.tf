terraform {
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
resource "genesyscloud_architect_user_prompt" "TestTerraformPrompt" {
  description = "Prompt"
  name        = "TestTerraformPrompt"
  resources {
    tts_string = "Hello This is Prudential Help line"
    language   = "en-us"
    text       = "Hello This is Prudential Help line"
  }
}

