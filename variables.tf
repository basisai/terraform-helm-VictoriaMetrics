#################################
# Default Scrape Settings
#################################
variable "scrape_skip_apiserver_tls_verify" {
  description = "Skip verifying TLS Certificate for Kubernetes Master Server Scrape target. Warning: This is insecure"
  default     = false
}

variable "scrape_skip_nodes_tls_verify" {
  description = "Skip verifying TLS Certificate for Kubernetes Nodes Scrape target. Warning: This is insecure"
  default     = false
}

variable "server_scrape_interval" {
  description = "How frequently to scrape targets by default"
  default     = "1m"
}

variable "server_scrape_timeout" {
  description = "How long until a scrape request times out"
  default     = "10s"
}

variable "server_alerts" {
  description = "Prometheus server alerts entries in YAML. Ref: https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/"
  default = <<-EOF
    []
    # - name: Instances
    #   rules:
    #     - alert: InstanceDown
    #       expr: up == 0
    #       for: 5m
    #       labels:
    #         severity: page
    #       annotations:
    #         description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.'
    #         summary: 'Instance {{ $labels.instance }} down'
    EOF
}

variable "server_rules" {
  description = "Prometheus server rules entries in YAML"

  default = <<-EOF
    []
    # - name: k8s_health
    #   rules:
    #     - record: k8s_container_oom
    #       expr: increase(kube_pod_container_status_last_terminated_reason{reason="OOMKilled"}[2m]) and on(pod) increase(kube_pod_container_status_restarts_total[2m])
    EOF
}

#################################
# VictoriaMetrics
#################################
variable "vm_helm_release_max_history" {
  description = "The maximum number of history releases to keep track for the VM helm release"
  default     = 20
}

variable "vm_release_name" {
  description = "Helm release name for VictoriaMetrics"
  default     = "victoria-metrics-cluster"
}

variable "vm_chart" {
  description = "Chart for VictoriaMetrics"
  default     = "victoria-metrics-cluster"
}

variable "vm_chart_repository_url" {
  description = "Chart Repository URL for VictoriaMetrics"
  default     = "https://victoriametrics.github.io/helm-charts/"
}

variable "vm_chart_version" {
  description = "Chart version for VictoriaMetrics"
  default     = "0.5.15"
}

variable "vm_namespace" {
  description = "Namespace for VictoriaMetrics"
  default     = "core"
}

variable "server_evaluation_interval" {
  description = "How frequently to evaluate rules"
  default     = "1m"
}

variable "server_additional_global" {
  description = "YAML string for additional global configuration for VM Server"
  default     = ""
}

#################################
# VictoriaMetrics Select service
#################################
variable "vm_psp_enabled" {
  description = "Enable PodSecurityPolicy in VictoriaMetrics"
  default     = true
}

variable "vm_service_account_annotations" {
  description = "Service Account Annotations for VictoriaMetrics"
  default     = {}
}

variable "vm_select_enabled" {
  description = "Deploy VictoriaMetrics Select"
  default     = true
}

variable "vm_select_image_repository" {
  description = "Image repository for VictoriaMetrics Select server"
  default     = "victoriametrics/vmselect"
}

variable "vm_select_image_tag" {
  description = "Image tag for VictoriaMetrics Select server"
  default     = "v1.37.4-cluster"
}

variable "vm_select_priority_class_name" {
  description = "Priority Class Name for VictoriaMetrics Select server"
  default     = ""
}

variable "vm_select_extra_args" {
  description = "Additional VictoriaMetrics Select container arguments"
  default     = {}
}

variable "vm_select_tolerations" {
  description = "Tolerations for VictoriaMetrics Select server"
  default     = []
}

variable "vm_select_node_selector" {
  description = "Node selector for VictoriaMetrics Select server pods"
  default     = {}
}

variable "vm_select_affinity" {
  description = "Affinity for VictoriaMetrics Select server pods"
  default     = {}
}

variable "vm_select_pod_annotations" {
  description = "Annotations for VictoriaMetrics Select server pods"
  default     = {}
}

variable "vm_select_replica_count" {
  description = "Number of replicas for VictoriaMetrics Select server"
  default     = 2
}

variable "vm_select_resources" {
  description = "Resources for VictoriaMetrics Select server"
  default     = {}
}

variable "vm_select_security_context" {
  description = "Security context for VictoriaMetrics Select server pods defined as a map which will be serialized to JSON"
  default     = {}
}

variable "vm_select_service_annotations" {
  description = "Annotations for VictoriaMetrics Select server service"
  default     = {}
}

variable "vm_select_service_labels" {
  description = "Labels for VictoriaMetrics Select server service"
  default     = {}
}

variable "vm_select_service_port" {
  description = "Service port for VictoriaMetrics Select server"
  default     = 8481
}

variable "vm_select_service_type" {
  description = "Type of service for VictoriaMetrics Select server"
  default     = "ClusterIP"
}

variable "vm_select_ingress_enabled" {
  description = "Enable ingress for VictoriaMetrics Select server"
  default     = false
}

variable "vm_select_ingress_annotations" {
  description = "Annotations for VictoriaMetrics Select server ingress"
  default     = {}
}

variable "vm_select_ingress_hosts" {
  description = "Ingress hosts for VictoriaMetrics Select server"
  default     = []
}

variable "vm_select_pv_enabled" {
  description = "Enable persistent volume on VictoriaMetrics Select server"
  default     = true
}

variable "vm_select_pv_access_modes" {
  description = "VictoriaMetrics Select server data Persistent Volume access modes"

  default = [
    "ReadWriteOnce",
  ]
}

variable "vm_select_pv_annotations" {
  description = "Annotations for VictoriaMetrics Select server PV"
  default     = {}
}

variable "vm_select_pv_size" {
  description = "VictoriaMetrics Select server data Persistent Volume size"
  default     = "8Gi"
}

#################################
# VictoriaMetrics Insert service
#################################
variable "vm_insert_enabled" {
  description = "Deploy VictoriaMetrics Insert"
  default     = true
}

variable "vm_insert_image_repository" {
  description = "Image repository for VictoriaMetrics Insert server"
  default     = "victoriametrics/vminsert"
}

variable "vm_insert_image_tag" {
  description = "Image tag for VictoriaMetrics Insert server"
  default     = "v1.37.4-cluster"
}

variable "vm_insert_priority_class_name" {
  description = "Priority Class Name for VictoriaMetrics Insert server"
  default     = ""
}

variable "vm_insert_extra_args" {
  description = "Additional VictoriaMetrics Insert container arguments"
  default     = {}
}

variable "vm_insert_tolerations" {
  description = "Tolerations for VictoriaMetrics Insert server"
  default     = []
}

variable "vm_insert_node_selector" {
  description = "Node selector for VictoriaMetrics Insert server pods"
  default     = {}
}

variable "vm_insert_affinity" {
  description = "Affinity for VictoriaMetrics Insert server pods"
  default     = {}
}

variable "vm_insert_pod_annotations" {
  description = "Annotations for VictoriaMetrics Insert server pods"
  default     = {}
}

variable "vm_insert_replica_count" {
  description = "Number of replicas for VictoriaMetrics Insert server"
  default     = 2
}

variable "vm_insert_resources" {
  description = "Resources for VictoriaMetrics Insert server"
  default     = {}
}

variable "vm_insert_security_context" {
  description = "Security context for VictoriaMetrics Insert server pods defined as a map which will be serialized to JSON."
  default     = {}
}

variable "vm_insert_service_annotations" {
  description = "Annotations for VictoriaMetrics Insert server service"
  default     = {}
}

variable "vm_insert_service_labels" {
  description = "Labels for VictoriaMetrics Insert server service"
  default     = {}
}

variable "vm_insert_service_port" {
  description = "Service port for VictoriaMetrics Insert server"
  default     = 8480
}

variable "vm_insert_service_type" {
  description = "Type of service for VictoriaMetrics Insert server"
  default     = "ClusterIP"
}

##################################
# VictoriaMetrics Storage service
##################################
variable "vm_storage_enabled" {
  description = "Deploy VictoriaMetrics Storage"
  default     = true
}

variable "vm_storage_image_repository" {
  description = "Image repository for VictoriaMetrics Storage server"
  default     = "victoriametrics/vmstorage"
}

variable "vm_storage_image_tag" {
  description = "Image tag for VictoriaMetrics Storage server"
  default     = "v1.37.4-cluster"
}

variable "vm_storage_priority_class_name" {
  description = "Priority Class Name for VictoriaMetrics Storage server"
  default     = ""
}

variable "vm_storage_retention_period" {
  description = "VictoriaMetrics Storage data retention period in months"
  default     = 1
}

variable "vm_storage_extra_args" {
  description = "Additional VictoriaMetrics Storage container arguments"
  default     = {}
}

variable "vm_storage_tolerations" {
  description = "Tolerations for VictoriaMetrics Storage server"
  default     = []
}

variable "vm_storage_node_selector" {
  description = "Node selector for VictoriaMetrics Storage server pods"
  default     = {}
}

variable "vm_storage_affinity" {
  description = "Affinity for VictoriaMetrics Storage server pods"
  default     = {}
}

variable "vm_storage_pv_enabled" {
  description = "Enable persistent volume on VictoriaMetrics Storage server"
  default     = true
}

variable "vm_storage_pv_access_modes" {
  description = "VictoriaMetrics Storage server data Persistent Volume access modes"

  default = [
    "ReadWriteOnce",
  ]
}

variable "vm_storage_pv_annotations" {
  description = "Annotations for VictoriaMetrics Storage server PV"
  default     = {}
}

variable "vm_storage_pv_size" {
  description = "VictoriaMetrics Storage server data Persistent Volume size"
  default     = "8Gi"
}

variable "vm_storage_pod_annotations" {
  description = "Annotations for VictoriaMetrics Storage server pods"
  default     = {}
}

variable "vm_storage_replica_count" {
  description = "Number of replicas for VictoriaMetrics Storage server"
  default     = 2
}

variable "vm_storage_resources" {
  description = "Resources for VictoriaMetrics Storage server"
  default     = {}
}

variable "vm_storage_security_context" {
  description = "Security context for VictoriaMetrics Storage server pods defined as a map which will be serialized to JSON"
  default     = {}
}

variable "vm_storage_service_annotations" {
  description = "Annotations for VictoriaMetrics Storage server service"
  default     = {}
}

variable "vm_storage_service_labels" {
  description = "Labels for VictoriaMetrics Storage server service"
  default     = {}
}

variable "vm_storage_service_port" {
  description = "Service port for VictoriaMetrics Storage server"
  default     = 8482
}

variable "vm_storage_vm_insert_port" {
  description = "Service port for for accepting connections from vminsert"
  default     = 8400
}

variable "vm_storage_vm_select_port" {
  description = "Service port for for accepting connections from vmselect"
  default     = 8401
}

variable "vm_storage_termination_grace_period_seconds" {
  description = "VictoriaMetrics Select server pods' termination grace period in seconds"
  default     = 60
}

#################################
# VictoriaMetrics Alert service
#################################
variable "vm_alert_enabled" {
  description = "Deploy VictoriaMetrics Alert"
  default     = false
}

variable "vm_alert_helm_release_max_history" {
  description = "The maximum number of history releases to keep track for the VM helm release"
  default     = 20
}

variable "vm_alert_release_name" {
  description = "Helm release name for VictoriaMetrics Alert"
  default     = "victoria-metrics-alert"
}

variable "vm_alert_chart" {
  description = "Chart for VictoriaMetrics Alert"
  default     = "victoria-metrics-alert"
}

variable "vm_alert_chart_repository_url" {
  description = "Chart Repository URL for VictoriaMetrics Alert"
  default     = "https://victoriametrics.github.io/helm-charts/"
}

variable "vm_alert_chart_version" {
  description = "Chart version for VictoriaMetrics Alert"
  default     = "0.0.16"
}

variable "vm_alert_namespace" {
  description = "Namespace for VictoriaMetrics Alert"
  default     = "core"
}

variable "vm_alert_image_repository" {
  description = "Image repository for VictoriaMetrics Alert server"
  default     = "victoriametrics/vmalert"
}

variable "vm_alert_image_tag" {
  description = "Image tag for VictoriaMetrics Alert server"
  default     = "v1.37.4"
}

variable "vm_alert_extra_args" {
  description = "Additional VictoriaMetrics Alert container arguments"
  default     = {}
}

variable "vm_alert_tolerations" {
  description = "Tolerations for VictoriaMetrics Alert server"
  default     = []
}

variable "vm_alert_node_selector" {
  description = "Node selector for VictoriaMetrics Alert server pods"
  default     = {}
}

variable "vm_alert_affinity" {
  description = "Affinity for VictoriaMetrics Alert server pods"
  default     = {}
}

variable "vm_alert_pod_annotations" {
  description = "Annotations for VictoriaMetrics Alert server pods"
  default     = {}
}

variable "vm_alert_replica_count" {
  description = "Number of replicas for VictoriaMetrics Alert server"
  default     = 1
}

variable "vm_alert_resources" {
  description = "Resources for VictoriaMetrics Alert server"
  default     = {}
}

variable "vm_alert_security_context" {
  description = "Security context for VictoriaMetrics Alert server pods defined as a map which will be serialized to JSON."
  default     = {}
}

variable "vm_alert_service_annotations" {
  description = "Annotations for VictoriaMetrics Alert server service"
  default     = {}
}

variable "vm_alert_service_labels" {
  description = "Labels for VictoriaMetrics Alert server service"
  default     = {}
}

variable "vm_alert_service_port" {
  description = "Service port for VictoriaMetrics Alert server"
  default     = 8880
}

variable "vm_alert_service_type" {
  description = "Type of service for VictoriaMetrics Alert server"
  default     = "ClusterIP"
}

variable "prometheus_alertmanager_url" {
  description = "URL to Prometheus Alertmanager"
  default     = ""
}

#################################
# VictoriaMetrics Agent service
#################################
variable "vm_agent_enabled" {
  description = "Deploy VictoriaMetrics Agent"
  default     = false
}

variable "vm_agent_helm_release_max_history" {
  description = "The maximum number of history releases to keep track for the VM helm release"
  default     = 20
}

variable "vm_agent_release_name" {
  description = "Helm release name for VictoriaMetrics Agent"
  default     = "victoria-metrics-agent"
}

variable "vm_agent_chart" {
  description = "Chart for VictoriaMetrics Agent"
  default     = "victoria-metrics-agent"
}

variable "vm_agent_chart_repository_url" {
  description = "Chart Repository URL for VictoriaMetrics Agent"
  default     = "https://victoriametrics.github.io/helm-charts/"
}

variable "vm_agent_chart_version" {
  description = "Chart version for VictoriaMetrics Agent"
  default     = "0.4.7"
}

variable "vm_agent_namespace" {
  description = "Namespace for VictoriaMetrics Agent"
  default     = "core"
}

variable "vm_agent_image_repository" {
  description = "Image repository for VictoriaMetrics Agent server"
  default     = "victoriametrics/vmagent"
}

variable "vm_agent_image_tag" {
  description = "Image tag for VictoriaMetrics Agent server"
  default     = "v1.37.4"
}

variable "vm_agent_extra_args" {
  description = "Additional VictoriaMetrics Agent container arguments"
  default     = {}
}

variable "vm_agent_tolerations" {
  description = "Tolerations for VictoriaMetrics Agent server"
  default     = []
}

variable "vm_agent_node_selector" {
  description = "Node selector for VictoriaMetrics Agent server pods"
  default     = {}
}

variable "vm_agent_affinity" {
  description = "Affinity for VictoriaMetrics Agent server pods"
  default     = {}
}

variable "vm_agent_pod_annotations" {
  description = "Annotations for VictoriaMetrics Agent server pods"
  default     = {}
}

variable "vm_agent_replica_count" {
  description = "Number of replicas for VictoriaMetrics Agent server"
  default     = 1
}

variable "vm_agent_resources" {
  description = "Resources for VictoriaMetrics Agent server"
  default     = {}
}

variable "vm_agent_security_context" {
  description = "Security context for VictoriaMetrics Agent server pods defined as a map which will be serialized to JSON."
  default     = {}
}

variable "vm_agent_extra_volumes" {
  description = "Extra volumes for VictoriaMetrics Agent"
  default     = []
}

variable "vm_agent_extra_volume_mounts" {
  description = "Extra volume mounts for VictoriaMetrics Agent"
  default     = []
}
