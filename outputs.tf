output "remote_write_api_url" {
  description = "URL for remote writing"
  value       = local.remote_write_api_url
}

output "remote_read_api_url" {
  description = "URL for remote reading"
  value       = local.remote_read_api_url
}

output "alerts_api_url" {
  description = "Alerts API URL"
  value       = local.alerts_api_url
}
