resource "helm_release" "vm" {
  name       = var.vm_release_name
  chart      = var.vm_chart
  repository = var.vm_chart_repository_url
  version    = var.vm_chart_version
  namespace  = var.vm_namespace

  max_history = var.vm_helm_release_max_history

  values = [
    templatefile("${path.module}/templates/victoriametrics.yaml", local.vm_values),
  ]
}

locals {
  scrape_config_values = {
    vm_agent_enabled = var.vm_agent_enabled

    scrape_skip_apiserver_tls_verify = var.scrape_skip_apiserver_tls_verify
    scrape_skip_nodes_tls_verify     = var.scrape_skip_nodes_tls_verify
  }


  self_scrape_config = [
    {
      job_name = "vmagent"
      static_configs = [
        {
          targets = ["localhost:8429"]
        }
      ]
    }
  ]

  vm_values = {
    psp_enabled                 = var.vm_psp_enabled
    service_account_annotations = jsonencode(var.vm_service_account_annotations)

    select_enabled             = var.vm_select_enabled
    select_image_repository    = var.vm_select_image_repository
    select_image_tag           = var.vm_select_image_tag
    select_priority_class_name = var.vm_select_priority_class_name
    select_extra_args = jsonencode(merge(
      var.vm_select_extra_args,
      {
        "envflag.enable" = true
        "envflag.prefix" = "VM_"
      }
    ))

    select_pdb_enabled       = var.vm_select_pdb_enabled
    select_pdb_min_available = var.vm_select_pdb_min_available
    select_env               = jsonencode(var.vm_select_env)

    select_tolerations     = jsonencode(var.vm_select_tolerations)
    select_node_selector   = jsonencode(var.vm_select_node_selector)
    select_affinity        = jsonencode(var.vm_select_affinity)
    select_pod_annotations = jsonencode(var.vm_select_pod_annotations)
    select_replica_count   = var.vm_select_replica_count
    select_resources       = jsonencode(var.vm_select_resources)

    select_security_context = jsonencode(var.vm_select_security_context)

    select_service_annotations = jsonencode(var.vm_select_service_annotations)
    select_service_labels      = jsonencode(var.vm_select_service_labels)
    select_service_port        = var.vm_select_service_port
    select_service_type        = var.vm_select_service_type

    select_ingress_enabled     = var.vm_select_ingress_enabled
    select_ingress_annotations = jsonencode(var.vm_select_ingress_annotations)
    select_ingress_hosts       = jsonencode(var.vm_select_ingress_hosts)

    select_pv_enabled      = var.vm_select_pv_enabled
    select_pv_access_modes = jsonencode(var.vm_select_pv_access_modes)
    select_pv_annotations  = jsonencode(var.vm_select_pv_annotations)
    select_pv_size         = var.vm_select_pv_size

    insert_enabled             = var.vm_insert_enabled
    insert_image_repository    = var.vm_insert_image_repository
    insert_image_tag           = var.vm_insert_image_tag
    insert_priority_class_name = var.vm_insert_priority_class_name
    insert_extra_args = jsonencode(merge(
      var.vm_insert_extra_args,
      {
        "envflag.enable" = true
        "envflag.prefix" = "VM_"
      }
    ))

    insert_pdb_enabled       = var.vm_insert_pdb_enabled
    insert_pdb_min_available = var.vm_insert_pdb_min_available
    insert_env               = jsonencode(var.vm_insert_env)

    insert_tolerations     = jsonencode(var.vm_insert_tolerations)
    insert_node_selector   = jsonencode(var.vm_insert_node_selector)
    insert_affinity        = jsonencode(var.vm_insert_affinity)
    insert_pod_annotations = jsonencode(var.vm_insert_pod_annotations)
    insert_replica_count   = var.vm_insert_replica_count
    insert_resources       = jsonencode(var.vm_insert_resources)

    insert_security_context = jsonencode(var.vm_insert_security_context)

    insert_service_annotations = jsonencode(var.vm_insert_service_annotations)
    insert_service_labels      = jsonencode(var.vm_insert_service_labels)
    insert_service_port        = var.vm_insert_service_port
    insert_service_type        = var.vm_insert_service_type

    storage_enabled             = var.vm_storage_enabled
    storage_image_repository    = var.vm_storage_image_repository
    storage_image_tag           = var.vm_storage_image_tag
    storage_priority_class_name = var.vm_storage_priority_class_name

    storage_retention_period = var.vm_storage_retention_period
    storage_extra_args = jsonencode(merge(
      var.vm_storage_extra_args,
      {
        "envflag.enable" = true
        "envflag.prefix" = "VM_"
      }
    ))

    storage_pdb_enabled       = var.vm_storage_pdb_enabled
    storage_pdb_min_available = var.vm_storage_pdb_min_available
    storage_env               = jsonencode(var.vm_storage_env)

    storage_tolerations   = jsonencode(var.vm_storage_tolerations)
    storage_node_selector = jsonencode(var.vm_storage_node_selector)
    storage_affinity      = jsonencode(var.vm_storage_affinity)

    storage_pv_enabled      = var.vm_storage_pv_enabled
    storage_pv_access_modes = jsonencode(var.vm_storage_pv_access_modes)
    storage_pv_annotations  = jsonencode(var.vm_storage_pv_annotations)
    storage_pv_size         = var.vm_storage_pv_size

    storage_pod_annotations = jsonencode(var.vm_storage_pod_annotations)
    storage_replica_count   = var.vm_storage_replica_count
    storage_resources       = jsonencode(var.vm_storage_resources)

    storage_security_context = jsonencode(var.vm_storage_security_context)

    storage_service_annotations = jsonencode(var.vm_storage_service_annotations)
    storage_service_labels      = jsonencode(var.vm_storage_service_labels)
    storage_service_port        = var.vm_storage_service_port
    storage_vm_insert_port      = var.vm_storage_vm_insert_port
    storage_vm_select_port      = var.vm_storage_vm_select_port

    storage_termination_grace_period_seconds = var.vm_storage_termination_grace_period_seconds
  }
}
