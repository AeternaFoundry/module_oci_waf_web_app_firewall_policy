resource "oci_waf_web_app_firewall_policy" "waf_web_app_firewall_policies" {
  for_each = var.waf_web_app_firewall_policies

  compartment_id = each.value.compartment_id
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags
  system_tags    = each.value.system_tags

  dynamic "actions" {
    for_each = each.value.actions != null ? each.value.actions : []
    content {
      dynamic "body" {
        for_each = actions.value.body != null ? [actions.value.body] : []
        content {
          template = body.value.template
          text     = body.value.text
          type     = body.value.type
        }
      }
      code = actions.value.code
      dynamic "headers" {
        for_each = actions.value.headers != null ? actions.value.headers : []
        content {
          name  = headers.value.name
          value = headers.value.value
        }
      }
      name = actions.value.name
      type = actions.value.type
    }
  }

  dynamic "request_access_control" {
    for_each = each.value.request_access_control != null ? [each.value.request_access_control] : []
    content {
      default_action_name = request_access_control.value.default_action_name
      dynamic "rules" {
        for_each = request_access_control.value.rules != null ? request_access_control.value.rules : []
        content {
          action_name        = rules.value.action_name
          condition          = rules.value.condition
          condition_language = rules.value.condition_language
          name               = rules.value.name
          type               = rules.value.type
        }
      }
    }
  }

  dynamic "request_protection" {
    for_each = each.value.request_protection != null ? [each.value.request_protection] : []
    content {
      body_inspection_size_limit_exceeded_action_name = request_protection.value.body_inspection_size_limit_exceeded_action_name
      body_inspection_size_limit_in_bytes             = request_protection.value.body_inspection_size_limit_in_bytes
      dynamic "rules" {
        for_each = request_protection.value.rules != null ? request_protection.value.rules : []
        content {
          action_name                = rules.value.action_name
          condition                  = rules.value.condition
          condition_language         = rules.value.condition_language
          is_body_inspection_enabled = rules.value.is_body_inspection_enabled
          name                       = rules.value.name
          dynamic "protection_capabilities" {
            for_each = rules.value.protection_capabilities
            content {
              action_name                    = protection_capabilities.value.action_name
              collaborative_action_threshold = protection_capabilities.value.collaborative_action_threshold
              dynamic "collaborative_weights" {
                for_each = protection_capabilities.value.collaborative_weights != null ? protection_capabilities.value.collaborative_weights : []
                content {
                  key    = collaborative_weights.value.key
                  weight = collaborative_weights.value.weight
                }
              }
              dynamic "exclusions" {
                for_each = protection_capabilities.value.exclusions != null ? [protection_capabilities.value.exclusions] : []
                content {
                  args            = exclusions.value.args
                  request_cookies = exclusions.value.request_cookies
                }
              }
              key     = protection_capabilities.value.key
              version = protection_capabilities.value.version
            }
          }
          dynamic "protection_capability_settings" {
            for_each = rules.value.protection_capability_settings != null ? [rules.value.protection_capability_settings] : []
            content {
              allowed_http_methods           = protection_capability_settings.value.allowed_http_methods
              max_http_request_header_length = protection_capability_settings.value.max_http_request_header_length
              max_http_request_headers       = protection_capability_settings.value.max_http_request_headers
              max_number_of_arguments        = protection_capability_settings.value.max_number_of_arguments
              max_single_argument_length     = protection_capability_settings.value.max_single_argument_length
              max_total_argument_length      = protection_capability_settings.value.max_total_argument_length
            }
          }
          type = rules.value.type
        }
      }
    }
  }

  dynamic "request_rate_limiting" {
    for_each = each.value.request_rate_limiting != null ? [each.value.request_rate_limiting] : []
    content {
      dynamic "rules" {
        for_each = request_rate_limiting.value.rules != null ? request_rate_limiting.value.rules : []
        content {
          action_name        = rules.value.action_name
          condition          = rules.value.condition
          condition_language = rules.value.condition_language
          dynamic "configurations" {
            for_each = rules.value.configurations
            content {
              action_duration_in_seconds = configurations.value.action_duration_in_seconds
              period_in_seconds          = configurations.value.period_in_seconds
              requests_limit             = configurations.value.requests_limit
            }
          }
          name = rules.value.name
          type = rules.value.type
        }
      }
    }
  }

  dynamic "response_access_control" {
    for_each = each.value.response_access_control != null ? [each.value.response_access_control] : []
    content {
      dynamic "rules" {
        for_each = response_access_control.value.rules != null ? response_access_control.value.rules : []
        content {
          action_name        = rules.value.action_name
          condition          = rules.value.condition
          condition_language = rules.value.condition_language
          name               = rules.value.name
          type               = rules.value.type
        }
      }
    }
  }

  dynamic "response_protection" {
    for_each = each.value.response_protection != null ? [each.value.response_protection] : []
    content {
      dynamic "rules" {
        for_each = response_protection.value.rules != null ? response_protection.value.rules : []
        content {
          action_name                = rules.value.action_name
          condition                  = rules.value.condition
          condition_language         = rules.value.condition_language
          is_body_inspection_enabled = rules.value.is_body_inspection_enabled
          name                       = rules.value.name
          dynamic "protection_capabilities" {
            for_each = rules.value.protection_capabilities
            content {
              action_name                    = protection_capabilities.value.action_name
              collaborative_action_threshold = protection_capabilities.value.collaborative_action_threshold
              dynamic "collaborative_weights" {
                for_each = protection_capabilities.value.collaborative_weights != null ? protection_capabilities.value.collaborative_weights : []
                content {
                  key    = collaborative_weights.value.key
                  weight = collaborative_weights.value.weight
                }
              }
              dynamic "exclusions" {
                for_each = protection_capabilities.value.exclusions != null ? [protection_capabilities.value.exclusions] : []
                content {
                  args            = exclusions.value.args
                  request_cookies = exclusions.value.request_cookies
                }
              }
              key     = protection_capabilities.value.key
              version = protection_capabilities.value.version
            }
          }
          dynamic "protection_capability_settings" {
            for_each = rules.value.protection_capability_settings != null ? [rules.value.protection_capability_settings] : []
            content {
              allowed_http_methods           = protection_capability_settings.value.allowed_http_methods
              max_http_request_header_length = protection_capability_settings.value.max_http_request_header_length
              max_http_request_headers       = protection_capability_settings.value.max_http_request_headers
              max_number_of_arguments        = protection_capability_settings.value.max_number_of_arguments
              max_single_argument_length     = protection_capability_settings.value.max_single_argument_length
              max_total_argument_length      = protection_capability_settings.value.max_total_argument_length
            }
          }
          type = rules.value.type
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

