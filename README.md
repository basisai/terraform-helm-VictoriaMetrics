# VictoriaMetrics

Deploys VictoriaMetrics cluster, agent and alert servers some supporting services on a Kubernetes cluster.

This module makes use of the
[`victoriametrics`](https://github.com/VictoriaMetrics/helm-charts) chart.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | ~> 2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.vm](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.vm_agent](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.vm_alert](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prometheus_alertmanager_url"></a> [prometheus\_alertmanager\_url](#input\_prometheus\_alertmanager\_url) | URL to Prometheus Alertmanager | `string` | `""` | no |
| <a name="input_scrape_skip_apiserver_tls_verify"></a> [scrape\_skip\_apiserver\_tls\_verify](#input\_scrape\_skip\_apiserver\_tls\_verify) | Skip verifying TLS Certificate for Kubernetes Master Server Scrape target. Warning: This is insecure | `bool` | `false` | no |
| <a name="input_scrape_skip_nodes_tls_verify"></a> [scrape\_skip\_nodes\_tls\_verify](#input\_scrape\_skip\_nodes\_tls\_verify) | Skip verifying TLS Certificate for Kubernetes Nodes Scrape target. Warning: This is insecure | `bool` | `false` | no |
| <a name="input_server_additional_global"></a> [server\_additional\_global](#input\_server\_additional\_global) | YAML string for additional global configuration for VM Server | `string` | `""` | no |
| <a name="input_server_alerts"></a> [server\_alerts](#input\_server\_alerts) | Prometheus server alerts entries in YAML. Ref: https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/ | `string` | `"[]\n# - name: Instances\n#   rules:\n#     - alert: InstanceDown\n#       expr: up == 0\n#       for: 5m\n#       labels:\n#         severity: page\n#       annotations:\n#         description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.'\n#         summary: 'Instance {{ $labels.instance }} down'\n"` | no |
| <a name="input_server_evaluation_interval"></a> [server\_evaluation\_interval](#input\_server\_evaluation\_interval) | How frequently to evaluate rules | `string` | `"1m"` | no |
| <a name="input_server_rules"></a> [server\_rules](#input\_server\_rules) | Prometheus server rules entries in YAML | `string` | `"[]\n# - name: k8s_health\n#   rules:\n#     - record: k8s_container_oom\n#       expr: increase(kube_pod_container_status_last_terminated_reason{reason=\"OOMKilled\"}[2m]) and on(pod) increase(kube_pod_container_status_restarts_total[2m])\n"` | no |
| <a name="input_server_scrape_interval"></a> [server\_scrape\_interval](#input\_server\_scrape\_interval) | How frequently to scrape targets by default | `string` | `"1m"` | no |
| <a name="input_server_scrape_timeout"></a> [server\_scrape\_timeout](#input\_server\_scrape\_timeout) | How long until a scrape request times out | `string` | `"10s"` | no |
| <a name="input_vm_agent_affinity"></a> [vm\_agent\_affinity](#input\_vm\_agent\_affinity) | Affinity for VictoriaMetrics Agent server pods | `map` | `{}` | no |
| <a name="input_vm_agent_chart"></a> [vm\_agent\_chart](#input\_vm\_agent\_chart) | Chart for VictoriaMetrics Agent | `string` | `"victoria-metrics-agent"` | no |
| <a name="input_vm_agent_chart_repository_url"></a> [vm\_agent\_chart\_repository\_url](#input\_vm\_agent\_chart\_repository\_url) | Chart Repository URL for VictoriaMetrics Agent | `string` | `"https://victoriametrics.github.io/helm-charts/"` | no |
| <a name="input_vm_agent_chart_version"></a> [vm\_agent\_chart\_version](#input\_vm\_agent\_chart\_version) | Chart version for VictoriaMetrics Agent | `string` | `"0.7.15"` | no |
| <a name="input_vm_agent_enabled"></a> [vm\_agent\_enabled](#input\_vm\_agent\_enabled) | Deploy VictoriaMetrics Agent | `bool` | `true` | no |
| <a name="input_vm_agent_env"></a> [vm\_agent\_env](#input\_vm\_agent\_env) | Environment variables for VictoriaMetrics Agent | `list` | `[]` | no |
| <a name="input_vm_agent_extra_args"></a> [vm\_agent\_extra\_args](#input\_vm\_agent\_extra\_args) | Additional VictoriaMetrics Agent container arguments | `map` | `{}` | no |
| <a name="input_vm_agent_extra_volume_mounts"></a> [vm\_agent\_extra\_volume\_mounts](#input\_vm\_agent\_extra\_volume\_mounts) | Extra volume mounts for VictoriaMetrics Agent | `list` | `[]` | no |
| <a name="input_vm_agent_extra_volumes"></a> [vm\_agent\_extra\_volumes](#input\_vm\_agent\_extra\_volumes) | Extra volumes for VictoriaMetrics Agent | `list` | `[]` | no |
| <a name="input_vm_agent_helm_release_max_history"></a> [vm\_agent\_helm\_release\_max\_history](#input\_vm\_agent\_helm\_release\_max\_history) | The maximum number of history releases to keep track for the VM helm release | `number` | `20` | no |
| <a name="input_vm_agent_image_repository"></a> [vm\_agent\_image\_repository](#input\_vm\_agent\_image\_repository) | Image repository for VictoriaMetrics Agent server | `string` | `"victoriametrics/vmagent"` | no |
| <a name="input_vm_agent_image_tag"></a> [vm\_agent\_image\_tag](#input\_vm\_agent\_image\_tag) | Image tag for VictoriaMetrics Agent server | `string` | `"v1.58.0"` | no |
| <a name="input_vm_agent_namespace"></a> [vm\_agent\_namespace](#input\_vm\_agent\_namespace) | Namespace for VictoriaMetrics Agent | `string` | `"core"` | no |
| <a name="input_vm_agent_node_selector"></a> [vm\_agent\_node\_selector](#input\_vm\_agent\_node\_selector) | Node selector for VictoriaMetrics Agent server pods | `map` | `{}` | no |
| <a name="input_vm_agent_pdb_enabled"></a> [vm\_agent\_pdb\_enabled](#input\_vm\_agent\_pdb\_enabled) | Enable PDB for VictoriaMetrics Agent server | `bool` | `false` | no |
| <a name="input_vm_agent_pdb_min_available"></a> [vm\_agent\_pdb\_min\_available](#input\_vm\_agent\_pdb\_min\_available) | Min Available PDB for VictoriaMetrics Agent server | `number` | `1` | no |
| <a name="input_vm_agent_pod_annotations"></a> [vm\_agent\_pod\_annotations](#input\_vm\_agent\_pod\_annotations) | Annotations for VictoriaMetrics Agent server pods | `map` | `{}` | no |
| <a name="input_vm_agent_release_name"></a> [vm\_agent\_release\_name](#input\_vm\_agent\_release\_name) | Helm release name for VictoriaMetrics Agent | `string` | `"victoria-metrics-agent"` | no |
| <a name="input_vm_agent_replica_count"></a> [vm\_agent\_replica\_count](#input\_vm\_agent\_replica\_count) | Number of replicas for VictoriaMetrics Agent server | `number` | `1` | no |
| <a name="input_vm_agent_resources"></a> [vm\_agent\_resources](#input\_vm\_agent\_resources) | Resources for VictoriaMetrics Agent server | `map` | `{}` | no |
| <a name="input_vm_agent_security_context"></a> [vm\_agent\_security\_context](#input\_vm\_agent\_security\_context) | Security context for VictoriaMetrics Agent server pods defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| <a name="input_vm_agent_tolerations"></a> [vm\_agent\_tolerations](#input\_vm\_agent\_tolerations) | Tolerations for VictoriaMetrics Agent server | `list` | `[]` | no |
| <a name="input_vm_alert_affinity"></a> [vm\_alert\_affinity](#input\_vm\_alert\_affinity) | Affinity for VictoriaMetrics Alert server pods | `map` | `{}` | no |
| <a name="input_vm_alert_chart"></a> [vm\_alert\_chart](#input\_vm\_alert\_chart) | Chart for VictoriaMetrics Alert | `string` | `"victoria-metrics-alert"` | no |
| <a name="input_vm_alert_chart_repository_url"></a> [vm\_alert\_chart\_repository\_url](#input\_vm\_alert\_chart\_repository\_url) | Chart Repository URL for VictoriaMetrics Alert | `string` | `"https://victoriametrics.github.io/helm-charts/"` | no |
| <a name="input_vm_alert_chart_version"></a> [vm\_alert\_chart\_version](#input\_vm\_alert\_chart\_version) | Chart version for VictoriaMetrics Alert | `string` | `"0.3.28"` | no |
| <a name="input_vm_alert_enabled"></a> [vm\_alert\_enabled](#input\_vm\_alert\_enabled) | Deploy VictoriaMetrics Alert | `bool` | `true` | no |
| <a name="input_vm_alert_env"></a> [vm\_alert\_env](#input\_vm\_alert\_env) | Environment variables for VictoriaMetrics Alert | `list` | `[]` | no |
| <a name="input_vm_alert_extra_args"></a> [vm\_alert\_extra\_args](#input\_vm\_alert\_extra\_args) | Additional VictoriaMetrics Alert container arguments | `map` | `{}` | no |
| <a name="input_vm_alert_helm_release_max_history"></a> [vm\_alert\_helm\_release\_max\_history](#input\_vm\_alert\_helm\_release\_max\_history) | The maximum number of history releases to keep track for the VM helm release | `number` | `20` | no |
| <a name="input_vm_alert_image_repository"></a> [vm\_alert\_image\_repository](#input\_vm\_alert\_image\_repository) | Image repository for VictoriaMetrics Alert server | `string` | `"victoriametrics/vmalert"` | no |
| <a name="input_vm_alert_image_tag"></a> [vm\_alert\_image\_tag](#input\_vm\_alert\_image\_tag) | Image tag for VictoriaMetrics Alert server | `string` | `"v1.58.0"` | no |
| <a name="input_vm_alert_namespace"></a> [vm\_alert\_namespace](#input\_vm\_alert\_namespace) | Namespace for VictoriaMetrics Alert | `string` | `"core"` | no |
| <a name="input_vm_alert_node_selector"></a> [vm\_alert\_node\_selector](#input\_vm\_alert\_node\_selector) | Node selector for VictoriaMetrics Alert server pods | `map` | `{}` | no |
| <a name="input_vm_alert_pdb_enabled"></a> [vm\_alert\_pdb\_enabled](#input\_vm\_alert\_pdb\_enabled) | Enable PDB for VictoriaMetrics Alert server | `bool` | `false` | no |
| <a name="input_vm_alert_pdb_min_available"></a> [vm\_alert\_pdb\_min\_available](#input\_vm\_alert\_pdb\_min\_available) | Min Available PDB for VictoriaMetrics Alert server | `number` | `1` | no |
| <a name="input_vm_alert_pod_annotations"></a> [vm\_alert\_pod\_annotations](#input\_vm\_alert\_pod\_annotations) | Annotations for VictoriaMetrics Alert server pods | `map` | `{}` | no |
| <a name="input_vm_alert_release_name"></a> [vm\_alert\_release\_name](#input\_vm\_alert\_release\_name) | Helm release name for VictoriaMetrics Alert | `string` | `"victoria-metrics-alert"` | no |
| <a name="input_vm_alert_replica_count"></a> [vm\_alert\_replica\_count](#input\_vm\_alert\_replica\_count) | Number of replicas for VictoriaMetrics Alert server | `number` | `1` | no |
| <a name="input_vm_alert_resources"></a> [vm\_alert\_resources](#input\_vm\_alert\_resources) | Resources for VictoriaMetrics Alert server | `map` | `{}` | no |
| <a name="input_vm_alert_security_context"></a> [vm\_alert\_security\_context](#input\_vm\_alert\_security\_context) | Security context for VictoriaMetrics Alert server pods defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| <a name="input_vm_alert_service_annotations"></a> [vm\_alert\_service\_annotations](#input\_vm\_alert\_service\_annotations) | Annotations for VictoriaMetrics Alert server service | `map` | `{}` | no |
| <a name="input_vm_alert_service_labels"></a> [vm\_alert\_service\_labels](#input\_vm\_alert\_service\_labels) | Labels for VictoriaMetrics Alert server service | `map` | `{}` | no |
| <a name="input_vm_alert_service_port"></a> [vm\_alert\_service\_port](#input\_vm\_alert\_service\_port) | Service port for VictoriaMetrics Alert server | `number` | `8880` | no |
| <a name="input_vm_alert_service_type"></a> [vm\_alert\_service\_type](#input\_vm\_alert\_service\_type) | Type of service for VictoriaMetrics Alert server | `string` | `"ClusterIP"` | no |
| <a name="input_vm_alert_tolerations"></a> [vm\_alert\_tolerations](#input\_vm\_alert\_tolerations) | Tolerations for VictoriaMetrics Alert server | `list` | `[]` | no |
| <a name="input_vm_chart"></a> [vm\_chart](#input\_vm\_chart) | Chart for VictoriaMetrics | `string` | `"victoria-metrics-cluster"` | no |
| <a name="input_vm_chart_repository_url"></a> [vm\_chart\_repository\_url](#input\_vm\_chart\_repository\_url) | Chart Repository URL for VictoriaMetrics | `string` | `"https://victoriametrics.github.io/helm-charts/"` | no |
| <a name="input_vm_chart_version"></a> [vm\_chart\_version](#input\_vm\_chart\_version) | Chart version for VictoriaMetrics | `string` | `"0.8.24"` | no |
| <a name="input_vm_helm_release_max_history"></a> [vm\_helm\_release\_max\_history](#input\_vm\_helm\_release\_max\_history) | The maximum number of history releases to keep track for the VM helm release | `number` | `20` | no |
| <a name="input_vm_insert_affinity"></a> [vm\_insert\_affinity](#input\_vm\_insert\_affinity) | Affinity for VictoriaMetrics Insert server pods | `map` | `{}` | no |
| <a name="input_vm_insert_enabled"></a> [vm\_insert\_enabled](#input\_vm\_insert\_enabled) | Deploy VictoriaMetrics Insert | `bool` | `true` | no |
| <a name="input_vm_insert_env"></a> [vm\_insert\_env](#input\_vm\_insert\_env) | Environment variables for VictoriaMetrics Insert | `list` | `[]` | no |
| <a name="input_vm_insert_extra_args"></a> [vm\_insert\_extra\_args](#input\_vm\_insert\_extra\_args) | Additional VictoriaMetrics Insert container arguments | `map` | `{}` | no |
| <a name="input_vm_insert_image_repository"></a> [vm\_insert\_image\_repository](#input\_vm\_insert\_image\_repository) | Image repository for VictoriaMetrics Insert server | `string` | `"victoriametrics/vminsert"` | no |
| <a name="input_vm_insert_image_tag"></a> [vm\_insert\_image\_tag](#input\_vm\_insert\_image\_tag) | Image tag for VictoriaMetrics Insert server | `string` | `"v1.58.0-cluster"` | no |
| <a name="input_vm_insert_node_selector"></a> [vm\_insert\_node\_selector](#input\_vm\_insert\_node\_selector) | Node selector for VictoriaMetrics Insert server pods | `map` | `{}` | no |
| <a name="input_vm_insert_pdb_enabled"></a> [vm\_insert\_pdb\_enabled](#input\_vm\_insert\_pdb\_enabled) | Enable PDB for VictoriaMetrics Insert server | `bool` | `true` | no |
| <a name="input_vm_insert_pdb_min_available"></a> [vm\_insert\_pdb\_min\_available](#input\_vm\_insert\_pdb\_min\_available) | Min Available PDB for VictoriaMetrics Insert server | `number` | `1` | no |
| <a name="input_vm_insert_pod_annotations"></a> [vm\_insert\_pod\_annotations](#input\_vm\_insert\_pod\_annotations) | Annotations for VictoriaMetrics Insert server pods | `map` | `{}` | no |
| <a name="input_vm_insert_priority_class_name"></a> [vm\_insert\_priority\_class\_name](#input\_vm\_insert\_priority\_class\_name) | Priority Class Name for VictoriaMetrics Insert server | `string` | `""` | no |
| <a name="input_vm_insert_replica_count"></a> [vm\_insert\_replica\_count](#input\_vm\_insert\_replica\_count) | Number of replicas for VictoriaMetrics Insert server | `number` | `2` | no |
| <a name="input_vm_insert_resources"></a> [vm\_insert\_resources](#input\_vm\_insert\_resources) | Resources for VictoriaMetrics Insert server | `map` | `{}` | no |
| <a name="input_vm_insert_security_context"></a> [vm\_insert\_security\_context](#input\_vm\_insert\_security\_context) | Security context for VictoriaMetrics Insert server pods defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| <a name="input_vm_insert_service_annotations"></a> [vm\_insert\_service\_annotations](#input\_vm\_insert\_service\_annotations) | Annotations for VictoriaMetrics Insert server service | `map` | `{}` | no |
| <a name="input_vm_insert_service_labels"></a> [vm\_insert\_service\_labels](#input\_vm\_insert\_service\_labels) | Labels for VictoriaMetrics Insert server service | `map` | `{}` | no |
| <a name="input_vm_insert_service_port"></a> [vm\_insert\_service\_port](#input\_vm\_insert\_service\_port) | Service port for VictoriaMetrics Insert server | `number` | `8480` | no |
| <a name="input_vm_insert_service_type"></a> [vm\_insert\_service\_type](#input\_vm\_insert\_service\_type) | Type of service for VictoriaMetrics Insert server | `string` | `"ClusterIP"` | no |
| <a name="input_vm_insert_tolerations"></a> [vm\_insert\_tolerations](#input\_vm\_insert\_tolerations) | Tolerations for VictoriaMetrics Insert server | `list` | `[]` | no |
| <a name="input_vm_namespace"></a> [vm\_namespace](#input\_vm\_namespace) | Namespace for VictoriaMetrics | `string` | `"core"` | no |
| <a name="input_vm_psp_enabled"></a> [vm\_psp\_enabled](#input\_vm\_psp\_enabled) | Enable PodSecurityPolicy in VictoriaMetrics | `bool` | `true` | no |
| <a name="input_vm_release_name"></a> [vm\_release\_name](#input\_vm\_release\_name) | Helm release name for VictoriaMetrics | `string` | `"victoria-metrics-cluster"` | no |
| <a name="input_vm_select_affinity"></a> [vm\_select\_affinity](#input\_vm\_select\_affinity) | Affinity for VictoriaMetrics Select server pods | `map` | `{}` | no |
| <a name="input_vm_select_enabled"></a> [vm\_select\_enabled](#input\_vm\_select\_enabled) | Deploy VictoriaMetrics Select | `bool` | `true` | no |
| <a name="input_vm_select_env"></a> [vm\_select\_env](#input\_vm\_select\_env) | Environment variables for VictoriaMetrics Select | `list` | `[]` | no |
| <a name="input_vm_select_extra_args"></a> [vm\_select\_extra\_args](#input\_vm\_select\_extra\_args) | Additional VictoriaMetrics Select container arguments | `map` | `{}` | no |
| <a name="input_vm_select_image_repository"></a> [vm\_select\_image\_repository](#input\_vm\_select\_image\_repository) | Image repository for VictoriaMetrics Select server | `string` | `"victoriametrics/vmselect"` | no |
| <a name="input_vm_select_image_tag"></a> [vm\_select\_image\_tag](#input\_vm\_select\_image\_tag) | Image tag for VictoriaMetrics Select server | `string` | `"v1.58.0-cluster"` | no |
| <a name="input_vm_select_ingress_annotations"></a> [vm\_select\_ingress\_annotations](#input\_vm\_select\_ingress\_annotations) | Annotations for VictoriaMetrics Select server ingress | `map` | `{}` | no |
| <a name="input_vm_select_ingress_enabled"></a> [vm\_select\_ingress\_enabled](#input\_vm\_select\_ingress\_enabled) | Enable ingress for VictoriaMetrics Select server | `bool` | `false` | no |
| <a name="input_vm_select_ingress_hosts"></a> [vm\_select\_ingress\_hosts](#input\_vm\_select\_ingress\_hosts) | Ingress hosts for VictoriaMetrics Select server | `list` | `[]` | no |
| <a name="input_vm_select_node_selector"></a> [vm\_select\_node\_selector](#input\_vm\_select\_node\_selector) | Node selector for VictoriaMetrics Select server pods | `map` | `{}` | no |
| <a name="input_vm_select_pdb_enabled"></a> [vm\_select\_pdb\_enabled](#input\_vm\_select\_pdb\_enabled) | Enable PDB for VictoriaMetrics Select server | `bool` | `true` | no |
| <a name="input_vm_select_pdb_min_available"></a> [vm\_select\_pdb\_min\_available](#input\_vm\_select\_pdb\_min\_available) | Min Available PDB for VictoriaMetrics Select server | `number` | `1` | no |
| <a name="input_vm_select_pod_annotations"></a> [vm\_select\_pod\_annotations](#input\_vm\_select\_pod\_annotations) | Annotations for VictoriaMetrics Select server pods | `map` | `{}` | no |
| <a name="input_vm_select_priority_class_name"></a> [vm\_select\_priority\_class\_name](#input\_vm\_select\_priority\_class\_name) | Priority Class Name for VictoriaMetrics Select server | `string` | `""` | no |
| <a name="input_vm_select_pv_access_modes"></a> [vm\_select\_pv\_access\_modes](#input\_vm\_select\_pv\_access\_modes) | VictoriaMetrics Select server data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| <a name="input_vm_select_pv_annotations"></a> [vm\_select\_pv\_annotations](#input\_vm\_select\_pv\_annotations) | Annotations for VictoriaMetrics Select server PV | `map` | `{}` | no |
| <a name="input_vm_select_pv_enabled"></a> [vm\_select\_pv\_enabled](#input\_vm\_select\_pv\_enabled) | Enable persistent volume on VictoriaMetrics Select server | `bool` | `true` | no |
| <a name="input_vm_select_pv_size"></a> [vm\_select\_pv\_size](#input\_vm\_select\_pv\_size) | VictoriaMetrics Select server data Persistent Volume size | `string` | `"8Gi"` | no |
| <a name="input_vm_select_replica_count"></a> [vm\_select\_replica\_count](#input\_vm\_select\_replica\_count) | Number of replicas for VictoriaMetrics Select server | `number` | `2` | no |
| <a name="input_vm_select_resources"></a> [vm\_select\_resources](#input\_vm\_select\_resources) | Resources for VictoriaMetrics Select server | `map` | `{}` | no |
| <a name="input_vm_select_security_context"></a> [vm\_select\_security\_context](#input\_vm\_select\_security\_context) | Security context for VictoriaMetrics Select server pods defined as a map which will be serialized to JSON | `map` | `{}` | no |
| <a name="input_vm_select_service_annotations"></a> [vm\_select\_service\_annotations](#input\_vm\_select\_service\_annotations) | Annotations for VictoriaMetrics Select server service | `map` | `{}` | no |
| <a name="input_vm_select_service_labels"></a> [vm\_select\_service\_labels](#input\_vm\_select\_service\_labels) | Labels for VictoriaMetrics Select server service | `map` | `{}` | no |
| <a name="input_vm_select_service_port"></a> [vm\_select\_service\_port](#input\_vm\_select\_service\_port) | Service port for VictoriaMetrics Select server | `number` | `8481` | no |
| <a name="input_vm_select_service_type"></a> [vm\_select\_service\_type](#input\_vm\_select\_service\_type) | Type of service for VictoriaMetrics Select server | `string` | `"ClusterIP"` | no |
| <a name="input_vm_select_tolerations"></a> [vm\_select\_tolerations](#input\_vm\_select\_tolerations) | Tolerations for VictoriaMetrics Select server | `list` | `[]` | no |
| <a name="input_vm_service_account_annotations"></a> [vm\_service\_account\_annotations](#input\_vm\_service\_account\_annotations) | Service Account Annotations for VictoriaMetrics | `map` | `{}` | no |
| <a name="input_vm_storage_affinity"></a> [vm\_storage\_affinity](#input\_vm\_storage\_affinity) | Affinity for VictoriaMetrics Storage server pods | `map` | `{}` | no |
| <a name="input_vm_storage_enabled"></a> [vm\_storage\_enabled](#input\_vm\_storage\_enabled) | Deploy VictoriaMetrics Storage | `bool` | `true` | no |
| <a name="input_vm_storage_env"></a> [vm\_storage\_env](#input\_vm\_storage\_env) | Environment variables for VictoriaMetrics Storage | `list` | `[]` | no |
| <a name="input_vm_storage_extra_args"></a> [vm\_storage\_extra\_args](#input\_vm\_storage\_extra\_args) | Additional VictoriaMetrics Storage container arguments | `map` | `{}` | no |
| <a name="input_vm_storage_image_repository"></a> [vm\_storage\_image\_repository](#input\_vm\_storage\_image\_repository) | Image repository for VictoriaMetrics Storage server | `string` | `"victoriametrics/vmstorage"` | no |
| <a name="input_vm_storage_image_tag"></a> [vm\_storage\_image\_tag](#input\_vm\_storage\_image\_tag) | Image tag for VictoriaMetrics Storage server | `string` | `"v1.58.0-cluster"` | no |
| <a name="input_vm_storage_node_selector"></a> [vm\_storage\_node\_selector](#input\_vm\_storage\_node\_selector) | Node selector for VictoriaMetrics Storage server pods | `map` | `{}` | no |
| <a name="input_vm_storage_pdb_enabled"></a> [vm\_storage\_pdb\_enabled](#input\_vm\_storage\_pdb\_enabled) | Enable PDB for VictoriaMetrics Storage server | `bool` | `true` | no |
| <a name="input_vm_storage_pdb_min_available"></a> [vm\_storage\_pdb\_min\_available](#input\_vm\_storage\_pdb\_min\_available) | Min Available PDB for VictoriaMetrics Storage server | `number` | `1` | no |
| <a name="input_vm_storage_pod_annotations"></a> [vm\_storage\_pod\_annotations](#input\_vm\_storage\_pod\_annotations) | Annotations for VictoriaMetrics Storage server pods | `map` | `{}` | no |
| <a name="input_vm_storage_priority_class_name"></a> [vm\_storage\_priority\_class\_name](#input\_vm\_storage\_priority\_class\_name) | Priority Class Name for VictoriaMetrics Storage server | `string` | `""` | no |
| <a name="input_vm_storage_pv_access_modes"></a> [vm\_storage\_pv\_access\_modes](#input\_vm\_storage\_pv\_access\_modes) | VictoriaMetrics Storage server data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| <a name="input_vm_storage_pv_annotations"></a> [vm\_storage\_pv\_annotations](#input\_vm\_storage\_pv\_annotations) | Annotations for VictoriaMetrics Storage server PV | `map` | `{}` | no |
| <a name="input_vm_storage_pv_enabled"></a> [vm\_storage\_pv\_enabled](#input\_vm\_storage\_pv\_enabled) | Enable persistent volume on VictoriaMetrics Storage server | `bool` | `true` | no |
| <a name="input_vm_storage_pv_size"></a> [vm\_storage\_pv\_size](#input\_vm\_storage\_pv\_size) | VictoriaMetrics Storage server data Persistent Volume size | `string` | `"8Gi"` | no |
| <a name="input_vm_storage_replica_count"></a> [vm\_storage\_replica\_count](#input\_vm\_storage\_replica\_count) | Number of replicas for VictoriaMetrics Storage server | `number` | `2` | no |
| <a name="input_vm_storage_resources"></a> [vm\_storage\_resources](#input\_vm\_storage\_resources) | Resources for VictoriaMetrics Storage server | `map` | `{}` | no |
| <a name="input_vm_storage_retention_period"></a> [vm\_storage\_retention\_period](#input\_vm\_storage\_retention\_period) | VictoriaMetrics Storage data retention period in months | `number` | `1` | no |
| <a name="input_vm_storage_security_context"></a> [vm\_storage\_security\_context](#input\_vm\_storage\_security\_context) | Security context for VictoriaMetrics Storage server pods defined as a map which will be serialized to JSON | `map` | `{}` | no |
| <a name="input_vm_storage_service_annotations"></a> [vm\_storage\_service\_annotations](#input\_vm\_storage\_service\_annotations) | Annotations for VictoriaMetrics Storage server service | `map` | `{}` | no |
| <a name="input_vm_storage_service_labels"></a> [vm\_storage\_service\_labels](#input\_vm\_storage\_service\_labels) | Labels for VictoriaMetrics Storage server service | `map` | `{}` | no |
| <a name="input_vm_storage_service_port"></a> [vm\_storage\_service\_port](#input\_vm\_storage\_service\_port) | Service port for VictoriaMetrics Storage server | `number` | `8482` | no |
| <a name="input_vm_storage_termination_grace_period_seconds"></a> [vm\_storage\_termination\_grace\_period\_seconds](#input\_vm\_storage\_termination\_grace\_period\_seconds) | VictoriaMetrics Select server pods' termination grace period in seconds | `number` | `60` | no |
| <a name="input_vm_storage_tolerations"></a> [vm\_storage\_tolerations](#input\_vm\_storage\_tolerations) | Tolerations for VictoriaMetrics Storage server | `list` | `[]` | no |
| <a name="input_vm_storage_vm_insert_port"></a> [vm\_storage\_vm\_insert\_port](#input\_vm\_storage\_vm\_insert\_port) | Service port for for accepting connections from vminsert | `number` | `8400` | no |
| <a name="input_vm_storage_vm_select_port"></a> [vm\_storage\_vm\_select\_port](#input\_vm\_storage\_vm\_select\_port) | Service port for for accepting connections from vmselect | `number` | `8401` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alerts_api_url"></a> [alerts\_api\_url](#output\_alerts\_api\_url) | Alerts API URL |
| <a name="output_remote_read_api_url"></a> [remote\_read\_api\_url](#output\_remote\_read\_api\_url) | URL for remote reading |
| <a name="output_remote_write_api_url"></a> [remote\_write\_api\_url](#output\_remote\_write\_api\_url) | URL for remote writing |
