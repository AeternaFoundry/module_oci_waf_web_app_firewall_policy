variable "waf_web_app_firewall_policies" {
  description = <<EOT
Map of waf_web_app_firewall_policies, attributes below
Required:
    - compartment_id
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - system_tags
    - actions (block):
        - body (optional, block):
            - template (optional)
            - text (optional)
            - type (required)
        - code (optional)
        - headers (optional, block):
            - name (optional)
            - value (optional)
        - name (required)
        - type (required)
    - request_access_control (block):
        - default_action_name (required)
        - rules (optional, block):
            - action_name (required)
            - condition (optional)
            - condition_language (optional)
            - name (required)
            - type (required)
    - request_protection (block):
        - body_inspection_size_limit_exceeded_action_name (optional)
        - body_inspection_size_limit_in_bytes (optional)
        - rules (optional, block):
            - action_name (required)
            - condition (optional)
            - condition_language (optional)
            - is_body_inspection_enabled (optional)
            - name (required)
            - protection_capabilities (required, block):
                - action_name (optional)
                - collaborative_action_threshold (optional)
                - collaborative_weights (optional, block):
                    - key (required)
                    - weight (required)
                - exclusions (optional, block):
                    - args (optional)
                    - request_cookies (optional)
                - key (required)
                - version (required)
            - protection_capability_settings (optional, block):
                - allowed_http_methods (optional)
                - max_http_request_header_length (optional)
                - max_http_request_headers (optional)
                - max_number_of_arguments (optional)
                - max_single_argument_length (optional)
                - max_total_argument_length (optional)
            - type (required)
    - request_rate_limiting (block):
        - rules (optional, block):
            - action_name (required)
            - condition (optional)
            - condition_language (optional)
            - configurations (required, block):
                - action_duration_in_seconds (optional)
                - period_in_seconds (required)
                - requests_limit (required)
            - name (required)
            - type (required)
    - response_access_control (block):
        - rules (optional, block):
            - action_name (required)
            - condition (optional)
            - condition_language (optional)
            - name (required)
            - type (required)
    - response_protection (block):
        - rules (optional, block):
            - action_name (required)
            - condition (optional)
            - condition_language (optional)
            - is_body_inspection_enabled (optional)
            - name (required)
            - protection_capabilities (required, block):
                - action_name (optional)
                - collaborative_action_threshold (optional)
                - collaborative_weights (optional, block):
                    - key (required)
                    - weight (required)
                - exclusions (optional, block):
                    - args (optional)
                    - request_cookies (optional)
                - key (required)
                - version (required)
            - protection_capability_settings (optional, block):
                - allowed_http_methods (optional)
                - max_http_request_header_length (optional)
                - max_http_request_headers (optional)
                - max_number_of_arguments (optional)
                - max_single_argument_length (optional)
                - max_total_argument_length (optional)
            - type (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    system_tags    = optional(map(string))
    actions = optional(list(object({
      body = optional(object({
        template = optional(string)
        text     = optional(string)
        type     = string
      }))
      code = optional(number)
      headers = optional(list(object({
        name  = optional(string)
        value = optional(string)
      })))
      name = string
      type = string
    })))
    request_access_control = optional(object({
      default_action_name = string
      rules = optional(list(object({
        action_name        = string
        condition          = optional(string)
        condition_language = optional(string)
        name               = string
        type               = string
      })))
    }))
    request_protection = optional(object({
      body_inspection_size_limit_exceeded_action_name = optional(string)
      body_inspection_size_limit_in_bytes             = optional(number)
      rules = optional(list(object({
        action_name                = string
        condition                  = optional(string)
        condition_language         = optional(string)
        is_body_inspection_enabled = optional(bool)
        name                       = string
        protection_capabilities = list(object({
          action_name                    = optional(string)
          collaborative_action_threshold = optional(number)
          collaborative_weights = optional(list(object({
            key    = string
            weight = number
          })))
          exclusions = optional(object({
            args            = optional(list(string))
            request_cookies = optional(list(string))
          }))
          key     = string
          version = number
        }))
        protection_capability_settings = optional(object({
          allowed_http_methods           = optional(list(string))
          max_http_request_header_length = optional(number)
          max_http_request_headers       = optional(number)
          max_number_of_arguments        = optional(number)
          max_single_argument_length     = optional(number)
          max_total_argument_length      = optional(number)
        }))
        type = string
      })))
    }))
    request_rate_limiting = optional(object({
      rules = optional(list(object({
        action_name        = string
        condition          = optional(string)
        condition_language = optional(string)
        configurations = list(object({
          action_duration_in_seconds = optional(number)
          period_in_seconds          = number
          requests_limit             = number
        }))
        name = string
        type = string
      })))
    }))
    response_access_control = optional(object({
      rules = optional(list(object({
        action_name        = string
        condition          = optional(string)
        condition_language = optional(string)
        name               = string
        type               = string
      })))
    }))
    response_protection = optional(object({
      rules = optional(list(object({
        action_name                = string
        condition                  = optional(string)
        condition_language         = optional(string)
        is_body_inspection_enabled = optional(bool)
        name                       = string
        protection_capabilities = list(object({
          action_name                    = optional(string)
          collaborative_action_threshold = optional(number)
          collaborative_weights = optional(list(object({
            key    = string
            weight = number
          })))
          exclusions = optional(object({
            args            = optional(list(string))
            request_cookies = optional(list(string))
          }))
          key     = string
          version = number
        }))
        protection_capability_settings = optional(object({
          allowed_http_methods           = optional(list(string))
          max_http_request_header_length = optional(number)
          max_http_request_headers       = optional(number)
          max_number_of_arguments        = optional(number)
          max_single_argument_length     = optional(number)
          max_total_argument_length      = optional(number)
        }))
        type = string
      })))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.waf_web_app_firewall_policies : (
        v.request_protection == null || (v.request_protection.rules == null || alltrue([for item in v.request_protection.rules : (length(item.protection_capabilities) >= 1)]))
      )
    ])
    error_message = "Each protection_capabilities list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.waf_web_app_firewall_policies : (
        v.request_rate_limiting == null || (v.request_rate_limiting.rules == null || alltrue([for item in v.request_rate_limiting.rules : (length(item.configurations) >= 1)]))
      )
    ])
    error_message = "Each configurations list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.waf_web_app_firewall_policies : (
        v.response_protection == null || (v.response_protection.rules == null || alltrue([for item in v.response_protection.rules : (length(item.protection_capabilities) >= 1)]))
      )
    ])
    error_message = "Each protection_capabilities list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.waf_web_app_firewall_policies : (
        v.actions == null || alltrue([for item in v.actions : (contains([for v in ["ALLOW", "CHECK", "RETURN_HTTP_RESPONSE"] : lower(v)], lower(item.type)))])
      )
    ])
    error_message = "must be one of: \"ALLOW\", \"CHECK\", \"RETURN_HTTP_RESPONSE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.waf_web_app_firewall_policies : (
        v.actions == null || alltrue([for item in v.actions : (item.body == null || (contains([for v in ["DYNAMIC", "STATIC_TEXT"] : lower(v)], lower(item.body.type))))])
      )
    ])
    error_message = "must be one of: \"DYNAMIC\", \"STATIC_TEXT\""
  }
}

