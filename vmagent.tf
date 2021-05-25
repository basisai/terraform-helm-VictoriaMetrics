resource "helm_release" "vm_agent" {
  count = var.vm_agent_enabled ? 1 : 0

  name       = var.vm_agent_release_name
  chart      = var.vm_agent_chart
  repository = var.vm_agent_chart_repository_url
  version    = var.vm_agent_chart_version
  namespace  = var.vm_agent_namespace

  max_history = var.vm_agent_helm_release_max_history

  values = [
    templatefile("${path.module}/templates/victoriametrics-agent.yaml", local.agent_values),
  ]
}

locals {
  agent_values = {
    image_repository = var.vm_agent_image_repository
    image_tag        = var.vm_agent_image_tag

    service_account_annotations = jsonencode(var.vm_agent_service_account_annotations)

    remote_write_url = local.remote_write_api_url
    extra_args = jsonencode(merge(
      var.vm_agent_extra_args,
      {
        "envflag.enable" = true
        "envflag.prefix" = "VM_"
      }
    ))

    pdb_min_available = var.vm_agent_pdb_min_available
    env               = jsonencode(var.vm_agent_env)

    replica_count    = var.vm_agent_replica_count
    security_context = jsonencode(var.vm_agent_security_context)
    resources        = jsonencode(var.vm_agent_resources)
    pod_annotations  = jsonencode(var.vm_agent_pod_annotations)
    node_selector    = jsonencode(var.vm_agent_node_selector)
    tolerations      = jsonencode(var.vm_agent_tolerations)
    affinity         = jsonencode(var.vm_agent_affinity)

    scrape_interval     = var.server_scrape_interval
    scrape_timeout      = var.server_scrape_timeout
    evaluation_interval = var.server_evaluation_interval
    additional_global   = var.server_additional_global

    self_scrape_config = indent(4, yamlencode(local.self_scrape_config))
    scrape_configs     = indent(4, templatefile("${path.module}/templates/scrape_configs.yaml", local.scrape_config_values))

    extra_volumes       = jsonencode(var.vm_agent_extra_volumes)
    extra_volume_mounts = jsonencode(var.vm_agent_extra_volume_mounts)
  }
}
