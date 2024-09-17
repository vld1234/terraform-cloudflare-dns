############################################################################
## variables.tf
############################################################################
variable "aws_region" {
  description = "The AWS region"
  default     = "us-west-2"
}

variable "cloudflare_api_token" {
  description = "cloudflare api token"
  type        = string
}

variable "dns_records" {
  description = "cloudflare api token"
  type        = string
}

variable "value_record" {
  description = "value for dns record"
  type        = string
}

variable "nel" {
  type        = bool
  default     = true
}

variable "http2" {
  type        = string
  description = "HTTP2 setting.\nAvailable on the following plans: \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "on"
}

variable "http3" {
  type        = string
  description = "HTTP3 setting.\nAvailable on the following plans: \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "on"
}

variable "ip_geolocation" {
  type        = string
  description = "Enable IP Geolocation to have Cloudflare geolocate visitors to your website and pass the country code to you.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "on"
}

variable "ipv6" {
  type        = string
  description = "Enable IPv6 on all subdomains that are Cloudflare enabled.\nAvailable on the following plans: \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "off"
}

variable "mirage" {
  type        = string
  description = "Automatically optimize image loading for website visitors on mobile devices.\nAvailable on the following plans: \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "off"
}

variable "websockets" {
  type        = string
  description = "WebSockets are open connections sustained between the client and the origin server. Inside a WebSockets connection, the client and the origin can pass data back and forth without having to reestablish sessions. This makes exchanging data within a WebSockets connection fast. WebSockets are often used for real-time applications such as live chat and gaming.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "on"
}

variable "cache_level" {
  type        = string
  description = "Cache Level functions based off the setting level. The basic setting will cache most static resources (i.e., css, images, and JavaScript). The simplified setting will ignore the query string when delivering a cached resource. The aggressive setting will cache all static resources, including ones with a query string.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"aggressive\", \"basic\", \"simplified\"."
  default     = "aggressive"
}

variable "polish" {
  type        = string
  description = "Strips metadata and compresses your images for faster page load times. Basic (Lossless): Reduce the size of PNG, JPEG, and GIF files - no impact on visual quality. Basic + JPEG (Lossy): Further reduce the size of JPEG files for faster image loading. Larger JPEGs are converted to progressive images, loading a lower-resolution image first and ending in a higher-resolution version. Not recommended for hi-res photography sites.\nAvailable on the following plans: \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"off\", \"lossless\", \"lossy\"."
  default     = "off"
}

variable "pseudo_ipv4" {
  type        = string
  description = "Pseudo IPv4 setting.\nAvailable on the following plans: \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"off\", \"add_header\", \"overwrite_header\"."
  default     = "add_header"
}

variable "ssl" {
  type        = string
  description = "SSL encrypts your visitor's connection and safeguards credit card numbers and other personal data to and from your website. SSL can take up to 5 minutes to fully activate. Requires Cloudflare active on your root domain or www domain. Off: no SSL between the visitor and Cloudflare, and no SSL between Cloudflare and your web server (all HTTP traffic). Flexible: SSL between the visitor and Cloudflare -- visitor sees HTTPS on your site, but no SSL between Cloudflare and your web server. You don't need to have an SSL cert on your web server, but your visitors will still see the site as being HTTPS enabled. Full: SSL between the visitor and Cloudflare -- visitor sees HTTPS on your site, and SSL between Cloudflare and your web server. You'll need to have your own SSL cert or self-signed cert at the very least. Full (Strict): SSL between the visitor and Cloudflare -- visitor sees HTTPS on your site, and SSL between Cloudflare and your web server. You'll need to have a valid SSL certificate installed on your web server. This certificate must be signed by a certificate authority, have an expiration date in the future, and respond for the request domain name (hostname).\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"off\", \"flexible\", \"full\", \"strict\", \"origin_pull\"."
  default     = "off"
}

variable "tls_1_3" {
  type        = string
  description = "Enable Crypto TLS 1.3 feature for this zone.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\", \"zrt\"."
  default     = "on"
}

variable "browser_cache_ttl" {
  type        = number
  description = "Browser Cache TTL (in seconds) specifies how long Cloudflare-cached resources will remain on your visitors' computers. Cloudflare will honor any larger times specified by your server. Setting a TTL of 0 is equivalent to selecting `Respect Existing Headers`.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: 0, 30, 60, 120, 300, 1200, 1800, 3600, 7200, 10800, 14400, 18000, 28800, 43200, 57600, 72000, 86400, 172800, 259200, 345600, 432000, 691200, 1382400, 2073600, 2678400, 5356800, 16070400, 31536000."
  default     = 14400
}

variable "ciphers" {
  type        = list(string)
  description = "An allowlist of ciphers for TLS termination. These ciphers must be in the BoringSSL format.\nAvailable on the following plans: Advanced Certificate Manager plan.\nPossible values for each element in the list: \"ECDHE-ECDSA-AES128-GCM-SHA256\", \"ECDHE-ECDSA-CHACHA20-POLY1305\", \"ECDHE-RSA-AES128-GCM-SHA256\", \"ECDHE-RSA-CHACHA20-POLY1305\", \"ECDHE-ECDSA-AES128-SHA256\", \"ECDHE-ECDSA-AES128-SHA\", \"ECDHE-RSA-AES128-SHA256\", \"ECDHE-RSA-AES128-SHA\", \"AES128-GCM-SHA256\", \"AES128-SHA256\", \"AES128-SHA\", \"ECDHE-ECDSA-AES256-GCM-SHA384\", \"ECDHE-ECDSA-AES256-SHA384\", \"ECDHE-RSA-AES256-GCM-SHA384\", \"ECDHE-RSA-AES256-SHA384\", \"ECDHE-RSA-AES256-SHA\", \"AES256-GCM-SHA384\", \"AES256-SHA256\", \"AES256-SHA\", \"DES-CBC3-SHA\", \"AEAD-AES128-GCM-SHA256\", \"AEAD-AES256-GCM-SHA384\", \"AEAD-CHACHA20-POLY1305-SHA256\"."
  # The `default` argument is used to make the variable optional
  default = ["ECDHE-ECDSA-AES128-GCM-SHA256","ECDHE-ECDSA-CHACHA20-POLY1305","ECDHE-RSA-AES128-GCM-SHA256","ECDHE-RSA-CHACHA20-POLY1305","ECDHE-ECDSA-AES256-GCM-SHA384","ECDHE-RSA-AES256-GCM-SHA384"]

  # The provider does not validate the variable value at the `terraform plan` stage
  # Supported cipher suites by protocol can be found at https://developers.cloudflare.com/ssl/ssl-tls/cipher-suites/#supported-cipher-suites-by-protocol
  # When trying to use the ciphers "AEAD-AES128-GCM-SHA256", "AEAD-AES256-GCM-SHA384", "AEAD-CHACHA20-POLY1305-SHA256", error 1007 is returned from the API, despite the fact that the ciphers are declared to be supported
/*   validation {
    condition = alltrue([
      for i in var.ciphers : contains(["ECDHE-ECDSA-AES128-GCM-SHA256", "ECDHE-ECDSA-CHACHA20-POLY1305", "ECDHE-RSA-AES128-GCM-SHA256", "ECDHE-RSA-CHACHA20-POLY1305", "ECDHE-ECDSA-AES128-SHA256", "ECDHE-ECDSA-AES128-SHA", "ECDHE-RSA-AES128-SHA256", "ECDHE-RSA-AES128-SHA", "AES128-GCM-SHA256", "AES128-SHA256", "AES128-SHA", "ECDHE-ECDSA-AES256-GCM-SHA384", "ECDHE-ECDSA-AES256-SHA384", "ECDHE-RSA-AES256-GCM-SHA384", "ECDHE-RSA-AES256-SHA384", "ECDHE-RSA-AES256-SHA", "AES256-GCM-SHA384", "AES256-SHA256", "AES256-SHA", "DES-CBC3-SHA", "AEAD-AES128-GCM-SHA256", "AEAD-AES256-GCM-SHA384", "AEAD-CHACHA20-POLY1305-SHA256"], i)
    ])
    error_message = "Error details: The ciphers value must be a list of one or more of the following values: \"ECDHE-ECDSA-AES128-GCM-SHA256\", \"ECDHE-ECDSA-CHACHA20-POLY1305\", \"ECDHE-RSA-AES128-GCM-SHA256\", \"ECDHE-RSA-CHACHA20-POLY1305\", \"ECDHE-ECDSA-AES128-SHA256\", \"ECDHE-ECDSA-AES128-SHA\", \"ECDHE-RSA-AES128-SHA256\", \"ECDHE-RSA-AES128-SHA\", \"AES128-GCM-SHA256\", \"AES128-SHA256\", \"AES128-SHA\", \"ECDHE-ECDSA-AES256-GCM-SHA384\", \"ECDHE-ECDSA-AES256-SHA384\", \"ECDHE-RSA-AES256-GCM-SHA384\", \"ECDHE-RSA-AES256-SHA384\", \"ECDHE-RSA-AES256-SHA\", \"AES256-GCM-SHA384\", \"AES256-SHA256\", \"AES256-SHA\", \"DES-CBC3-SHA\", \"AEAD-AES128-GCM-SHA256\", \"AEAD-AES256-GCM-SHA384\", \"AEAD-CHACHA20-POLY1305-SHA256\"."
  }terraform */
}

# All attribute fields with default values are required by the provider
variable "minify" {
  description = "Automatically minify certain assets for your website.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values for each argument: \"on\", \"off\"."
  # These defaults don't really apply and are only for generating documentation with terraform-docs, the module applies defaults itself, see main.tf
  # Also, the `default` argument is used to make the variable optional
  default = {
    css  = "off"
    html = "off"
    js   = "off"
  }
}

variable "mobile_redirect" {
  description = "Automatically redirect visitors on mobile devices to a mobile-optimized subdomain.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values for the `status` argument: \"on\", \"off\".\nPossible values for the `strip_uri` argument: true, false."
  # These defaults don't really apply and are only for generating documentation with terraform-docs, the module applies defaults itself, see module defaults above
  # Also, the `default` argument is used to make the variable optional
  default = {
    mobile_subdomain = ""
    status           = "off"
    strip_uri        = false
  }
}

variable "always_use_https" {
  type        = string
  description = "Reply to all requests for URLs that use 'http' with a 301 redirect to the equivalent 'https' URL. If you only want to redirect for a subset of requests, consider creating an 'Always use HTTPS' page rule.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "on"
}

variable "origin_max_http_version" {
  type        = string
  description = "The highest HTTP version Cloudflare will attempt to use with your origin. This setting allows Cloudflare to make HTTP/2 requests to your origin.\nNote that you must contact customer support / account team to enable this setting before use, otherwise you will not be able to change it.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: 1, 2."
  default     = 2
}

variable "opportunistic_onion" {
  type        = string
  description = "Add an Alt-Svc header to all legitimate requests from Tor, allowing the connection to use our onion services instead of exit nodes.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"on\", \"off\"."
  default     = "on"
}

variable "min_tls_version" {
  type        = string
  description = "Only accept HTTPS requests that use at least the TLS protocol version specified. For example, if TLS 1.1 is selected, TLS 1.0 connections will be rejected, while 1.1, 1.2, and 1.3 (if enabled) will be permitted.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values: \"1.0\", \"1.1\", \"1.2\", \"1.3\"."
  default     = "1.2"
}

variable "security_header" {
  description = "Cloudflare security headers for a zone.\nAvailable on the following plans: \"free\", \"partners_free\", \"pro\", \"partners_pro\", \"business\", \"partners_business\", \"enterprise\", \"partners_enterprise\".\nPossible values for the `enabled` argument: true, false.\nPossible values for the `preload` argument: true, false.\nPossible values for the `max_age` argument: between 0 and 2147483647.\nPossible values for the `include_subdomains` argument: true, false.\nPossible values for the `nosniff` argument: true, false."
  # These defaults don't really apply and are only for generating documentation with terraform-docs, the provider applies defaults itself, see the provider docs for more info
  # Also, the `default` argument is used to make the variable optional
  default = {
    enabled            = true
    preload            = false
    max_age            = 86400
    include_subdomains = true
    nosniff            = true
  }
}

############################################################################
## https://github.com/alex-feel/terraform-cloudflare-zone/blob/main/variables.tf
############################################################################
