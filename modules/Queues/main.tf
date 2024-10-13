terraform {
  required_providers {
    genesyscloud = {
      source = "MyPureCloud/genesyscloud"
      version = "1.49.1"
    }
  }
}
resource "genesyscloud_routing_queue" "Test_Form_Queue" {
  suppress_in_queue_call_recording = true
  media_settings_chat {
    enable_auto_dial_and_end  = false
    service_level_duration_ms = 20000
    service_level_percentage  = 0.8
    alerting_timeout_sec      = 30
    enable_auto_answer        = false
  }
  skill_evaluation_method  = "BEST"
  enable_audio_monitoring  = false
  enable_transcription     = false
  description              = "Test Queue for Terraform"
  enable_manual_assignment = false
  media_settings_callback {
    enable_auto_answer        = false
    enable_auto_dial_and_end  = false
    service_level_duration_ms = 20000
    service_level_percentage  = 0.8
    alerting_timeout_sec      = 30
    auto_dial_delay_seconds   = 300
    auto_end_delay_seconds    = 300
  }
  acw_wrapup_prompt = "OPTIONAL"
  auto_answer_only  = false
  media_settings_email {
    service_level_percentage  = 0.8
    alerting_timeout_sec      = 300
    enable_auto_answer        = false
    enable_auto_dial_and_end  = false
    service_level_duration_ms = 86400000
  }
  media_settings_message {
    enable_auto_dial_and_end  = false
    service_level_duration_ms = 20000
    service_level_percentage  = 0.8
    alerting_timeout_sec      = 30
    enable_auto_answer        = false
  }
  media_settings_call {
    enable_auto_dial_and_end  = false
    service_level_duration_ms = 20000
    service_level_percentage  = 0.8
    alerting_timeout_sec      = 8
    enable_auto_answer        = false
  }
  scoring_method = "TimestampAndPriority"
  name           = "Test_Form_Queue"
}

