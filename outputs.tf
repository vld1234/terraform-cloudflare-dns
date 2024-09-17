output "record" {
  value     = cloudflare_record.cname.hostname
}

output "metadata" {
  value     = cloudflare_record.cname.metadata
  sensitive = true
}
