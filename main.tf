locals {
  remote_write_api_url = var.remote_write_api_url_override != null && var.remote_write_api_url_override != "" ? (
    var.remote_write_api_url_override
    ) : (
    var.vm_enabled && var.vm_insert_enabled ? (
      "http://${helm_release.vm[0].metadata[0].name}-vminsert.${helm_release.vm[0].metadata[0].namespace}.svc.cluster.local:${var.vm_insert_service_port}/insert/0/prometheus"
    ) : ""
  )

  remote_read_api_url = var.remote_read_api_url_override != null && var.remote_read_api_url_override != "" ? (
    var.remote_read_api_url_override
    ) : (
    var.vm_enabled && var.vm_select_enabled ? (
      "http://${helm_release.vm[0].metadata[0].name}-vmselect.${helm_release.vm[0].metadata[0].namespace}.svc.cluster.local:${var.vm_select_service_port}/select/0/prometheus"
    ) : ""
  )

  alerts_api_url = var.vm_alert_enabled ? "http://${helm_release.vm_alert[0].metadata[0].name}-server.${helm_release.vm_alert[0].metadata[0].namespace}.svc.cluster.local:${var.vm_alert_service_port}" : ""
}
