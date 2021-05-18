resource "helm_release" "vm_alert" {
  count = var.vm_alert_enabled ? 1 : 0

  name       = var.vm_alert_release_name
  chart      = var.vm_alert_chart
  repository = var.vm_alert_chart_repository_url
  version    = var.vm_alert_chart_version
  namespace  = var.vm_alert_namespace

  max_history = var.vm_alert_helm_release_max_history

  values = [
    templatefile("${path.module}/templates/victoriametrics-alert.yaml", local.alert_values),
  ]
}

locals {
  alert_values = {
    enabled          = var.vm_alert_enabled
    image_repository = var.vm_alert_image_repository
    image_tag        = var.vm_alert_image_tag

    pdb_enabled       = var.vm_alert_pdb_enabled
    pdb_min_available = var.vm_alert_pdb_min_available
    env               = jsonencode(var.vm_alert_env)

    datasource_url   = local.remote_read_api_url
    remote_write_url = local.remote_write_api_url
    remote_read_url  = local.remote_read_api_url
    alertmanager_url = var.prometheus_alertmanager_url
    extra_args = jsonencode(merge(
      var.vm_alert_extra_args,
      {
        "envflag.enable" = true
        "envflag.prefix" = "VM_"
      }
    ))

    service_annotations = jsonencode(var.vm_alert_service_annotations)
    service_labels      = jsonencode(var.vm_alert_service_labels)
    service_port        = var.vm_alert_service_port
    service_type        = var.vm_alert_service_type

    replica_count    = var.vm_alert_replica_count
    security_context = jsonencode(var.vm_alert_security_context)
    resources        = jsonencode(var.vm_alert_resources)
    pod_annotations  = jsonencode(var.vm_alert_pod_annotations)
    node_selector    = jsonencode(var.vm_alert_node_selector)
    tolerations      = jsonencode(var.vm_alert_tolerations)
    affinity         = jsonencode(var.vm_alert_affinity)

    alerts = indent(8, var.server_alerts)
    rules  = indent(8, var.server_rules)
  }
}
