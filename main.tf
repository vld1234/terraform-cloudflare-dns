data "cloudflare_zone" "domain" {
  name = var.dns_records
}

resource "cloudflare_record" "cname" {
  zone_id = data.cloudflare_zone.domain.id
  name    = "tstst"
  value   = var.value_record
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_ruleset" "waf_rules" {
  name        = "WAF custom rules"
  description = "WAF custom rules"
  kind        = "zone"
  phase       = "http_request_firewall_custom"
  zone_id     = data.cloudflare_zone.domain.id

  rules {
    action      = "skip"
    expression  = "lower(http.request.uri.path) matches \"^/\\.well\\-known/acme\\-challenge/.*\""
    enabled     = true
    description = "Allow lets encrypt to get certificate in ArgoCD"

    logging {
      enabled = true
    }
    action_parameters {
      ruleset = "current"
    }
  }

  rules {
    action      = "block"
    expression  = "http.request.uri.path contains \"/bda-admin\" and ( not ip.src in $bda_employee_allowlist and not ip.src in $vpn and not ip.src in $partners_vendors)"
    enabled     = true
    description = "Restrict Admin Panel Access"
  }

  rules {
    action      = "block"
    expression  = "(not ip.src in $allow_list_bdahs_migrated and not ip.src in $allow_list_webscale_migrated and not ip.src in $bda_employee_allowlist and not ip.src in $client_allowlist and not ip.src in $partners_epmloyee_list and not ip.src in $partners_vendors and not ip.src in $third_party_apps and not ip.src in $vpn)"
    enabled     = false
    description = "Block all but allow IP lists"
  }

}

resource "cloudflare_zone_settings_override" "optimization" {
  zone_id = data.cloudflare_zone.domain.id
  initial_settings = null
  settings {

    tls_1_3                  = var.tls_1_3
    ip_geolocation           = var.ip_geolocation
    ipv6                     = var.ipv6
    always_use_https         = var.always_use_https
    origin_max_http_version  = var.origin_max_http_version
    cache_level              = var.cache_level
    browser_cache_ttl        = var.browser_cache_ttl
    websockets               = var.websockets
    pseudo_ipv4              = var.pseudo_ipv4
    opportunistic_onion      = var.opportunistic_onion
    min_tls_version          = var.min_tls_version
    ciphers                  = var.ciphers

    minify {
      css  = "off"
      html = "off"
      js   = "off"
    }

    mobile_redirect {
      mobile_subdomain = ""
      status           = "off"
      strip_uri        = false
    }

#    nel {
#      enabled = var.nel
#   }

    security_header {
      enabled            = false
      include_subdomains = false
      max_age            = 0
      nosniff            = false
      preload            = false
    }
  }
}

resource "cloudflare_healthcheck" "http_health_check" {
  zone_id = data.cloudflare_zone.domain.id
  name = "${cloudflare_record.cname.hostname}"
  description = "http health check"
  address = var.value_record
  suspended = false
  check_regions = [
    "ALL_REGIONS"
  ]
  type = "HTTPS"
  port = 443
  method = "GET"
  path = "/rest/V1/directory/currency"
  expected_body = "\"base_currency_code\":\"USD\""
  expected_codes = [
    "200"
  ]
  follow_redirects = true
  allow_insecure = false

  header {
    header = "Host"
    values = ["${cloudflare_record.cname.hostname}"]
  }
  timeout = 5
  retries = 2
  interval = 60
  consecutive_fails = 3
  consecutive_successes = 2
}
