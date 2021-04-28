# VictoriaMetrics

Deploys VictoriaMetrics cluster, agent and alert servers some supporting services on a Kubernetes cluster.

This module makes use of the
[`victoriametrics`](https://github.com/VictoriaMetrics/helm-charts) chart.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| helm | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| helm | ~> 2.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| prometheus\_alertmanager\_url | URL to Prometheus Alertmanager | `string` | `""` | no |
| scrape\_skip\_apiserver\_tls\_verify | Skip verifying TLS Certificate for Kubernetes Master Server Scrape target. Warning: This is insecure | `bool` | `false` | no |
| scrape\_skip\_nodes\_tls\_verify | Skip verifying TLS Certificate for Kubernetes Nodes Scrape target. Warning: This is insecure | `bool` | `false` | no |
| server\_additional\_global | YAML string for additional global configuration for VM Server | `string` | `""` | no |
| server\_alerts | Prometheus server alerts entries in YAML. Ref: https://prometheus.io/docs/prometheus/latest/configuration/alerting_rules/ | `string` | `"[]\n# - name: Instances\n#   rules:\n#     - alert: InstanceDown\n#       expr: up == 0\n#       for: 5m\n#       labels:\n#         severity: page\n#       annotations:\n#         description: '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.'\n#         summary: 'Instance {{ $labels.instance }} down'\n"` | no |
| server\_evaluation\_interval | How frequently to evaluate rules | `string` | `"1m"` | no |
| server\_rules | Prometheus server rules entries in YAML | `string` | `"[]\n# - name: k8s_health\n#   rules:\n#     - record: k8s_container_oom\n#       expr: increase(kube_pod_container_status_last_terminated_reason{reason=\"OOMKilled\"}[2m]) and on(pod) increase(kube_pod_container_status_restarts_total[2m])\n"` | no |
| server\_scrape\_interval | How frequently to scrape targets by default | `string` | `"1m"` | no |
| server\_scrape\_timeout | How long until a scrape request times out | `string` | `"10s"` | no |
| vm\_agent\_affinity | Affinity for VictoriaMetrics Agent server pods | `map` | `{}` | no |
| vm\_agent\_chart | Chart for VictoriaMetrics Agent | `string` | `"victoria-metrics-agent"` | no |
| vm\_agent\_chart\_repository\_url | Chart Repository URL for VictoriaMetrics Agent | `string` | `"https://victoriametrics.github.io/helm-charts/"` | no |
| vm\_agent\_chart\_version | Chart version for VictoriaMetrics Agent | `string` | `"0.7.15"` | no |
| vm\_agent\_enabled | Deploy VictoriaMetrics Agent | `bool` | `true` | no |
| vm\_agent\_env | Environment variables for VictoriaMetrics Agent | `list` | `[]` | no |
| vm\_agent\_extra\_args | Additional VictoriaMetrics Agent container arguments | `map` | `{}` | no |
| vm\_agent\_extra\_volume\_mounts | Extra volume mounts for VictoriaMetrics Agent | `list` | `[]` | no |
| vm\_agent\_extra\_volumes | Extra volumes for VictoriaMetrics Agent | `list` | `[]` | no |
| vm\_agent\_helm\_release\_max\_history | The maximum number of history releases to keep track for the VM helm release | `number` | `20` | no |
| vm\_agent\_image\_repository | Image repository for VictoriaMetrics Agent server | `string` | `"victoriametrics/vmagent"` | no |
| vm\_agent\_image\_tag | Image tag for VictoriaMetrics Agent server | `string` | `"v1.58.0"` | no |
| vm\_agent\_namespace | Namespace for VictoriaMetrics Agent | `string` | `"core"` | no |
| vm\_agent\_node\_selector | Node selector for VictoriaMetrics Agent server pods | `map` | `{}` | no |
| vm\_agent\_pdb\_min\_available | Min Available PDB for VictoriaMetrics Agent server | `number` | `1` | no |
| vm\_agent\_pod\_annotations | Annotations for VictoriaMetrics Agent server pods | `map` | `{}` | no |
| vm\_agent\_release\_name | Helm release name for VictoriaMetrics Agent | `string` | `"victoria-metrics-agent"` | no |
| vm\_agent\_replica\_count | Number of replicas for VictoriaMetrics Agent server | `number` | `1` | no |
| vm\_agent\_resources | Resources for VictoriaMetrics Agent server | `map` | `{}` | no |
| vm\_agent\_security\_context | Security context for VictoriaMetrics Agent server pods defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| vm\_agent\_tolerations | Tolerations for VictoriaMetrics Agent server | `list` | `[]` | no |
| vm\_alert\_affinity | Affinity for VictoriaMetrics Alert server pods | `map` | `{}` | no |
| vm\_alert\_chart | Chart for VictoriaMetrics Alert | `string` | `"victoria-metrics-alert"` | no |
| vm\_alert\_chart\_repository\_url | Chart Repository URL for VictoriaMetrics Alert | `string` | `"https://victoriametrics.github.io/helm-charts/"` | no |
| vm\_alert\_chart\_version | Chart version for VictoriaMetrics Alert | `string` | `"0.3.28"` | no |
| vm\_alert\_enabled | Deploy VictoriaMetrics Alert | `bool` | `true` | no |
| vm\_alert\_env | Environment variables for VictoriaMetrics Alert | `list` | `[]` | no |
| vm\_alert\_extra\_args | Additional VictoriaMetrics Alert container arguments | `map` | `{}` | no |
| vm\_alert\_helm\_release\_max\_history | The maximum number of history releases to keep track for the VM helm release | `number` | `20` | no |
| vm\_alert\_image\_repository | Image repository for VictoriaMetrics Alert server | `string` | `"victoriametrics/vmalert"` | no |
| vm\_alert\_image\_tag | Image tag for VictoriaMetrics Alert server | `string` | `"v1.58.0"` | no |
| vm\_alert\_namespace | Namespace for VictoriaMetrics Alert | `string` | `"core"` | no |
| vm\_alert\_node\_selector | Node selector for VictoriaMetrics Alert server pods | `map` | `{}` | no |
| vm\_alert\_pdb\_min\_available | Min Available PDB for VictoriaMetrics Alert server | `number` | `1` | no |
| vm\_alert\_pod\_annotations | Annotations for VictoriaMetrics Alert server pods | `map` | `{}` | no |
| vm\_alert\_release\_name | Helm release name for VictoriaMetrics Alert | `string` | `"victoria-metrics-alert"` | no |
| vm\_alert\_replica\_count | Number of replicas for VictoriaMetrics Alert server | `number` | `1` | no |
| vm\_alert\_resources | Resources for VictoriaMetrics Alert server | `map` | `{}` | no |
| vm\_alert\_security\_context | Security context for VictoriaMetrics Alert server pods defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| vm\_alert\_service\_annotations | Annotations for VictoriaMetrics Alert server service | `map` | `{}` | no |
| vm\_alert\_service\_labels | Labels for VictoriaMetrics Alert server service | `map` | `{}` | no |
| vm\_alert\_service\_port | Service port for VictoriaMetrics Alert server | `number` | `8880` | no |
| vm\_alert\_service\_type | Type of service for VictoriaMetrics Alert server | `string` | `"ClusterIP"` | no |
| vm\_alert\_tolerations | Tolerations for VictoriaMetrics Alert server | `list` | `[]` | no |
| vm\_chart | Chart for VictoriaMetrics | `string` | `"victoria-metrics-cluster"` | no |
| vm\_chart\_repository\_url | Chart Repository URL for VictoriaMetrics | `string` | `"https://victoriametrics.github.io/helm-charts/"` | no |
| vm\_chart\_version | Chart version for VictoriaMetrics | `string` | `"0.8.24"` | no |
| vm\_helm\_release\_max\_history | The maximum number of history releases to keep track for the VM helm release | `number` | `20` | no |
| vm\_insert\_affinity | Affinity for VictoriaMetrics Insert server pods | `map` | `{}` | no |
| vm\_insert\_enabled | Deploy VictoriaMetrics Insert | `bool` | `true` | no |
| vm\_insert\_env | Environment variables for VictoriaMetrics Insert | `list` | `[]` | no |
| vm\_insert\_extra\_args | Additional VictoriaMetrics Insert container arguments | `map` | `{}` | no |
| vm\_insert\_image\_repository | Image repository for VictoriaMetrics Insert server | `string` | `"victoriametrics/vminsert"` | no |
| vm\_insert\_image\_tag | Image tag for VictoriaMetrics Insert server | `string` | `"v1.58.0-cluster"` | no |
| vm\_insert\_node\_selector | Node selector for VictoriaMetrics Insert server pods | `map` | `{}` | no |
| vm\_insert\_pdb\_min\_available | Min Available PDB for VictoriaMetrics Insert server | `number` | `1` | no |
| vm\_insert\_pod\_annotations | Annotations for VictoriaMetrics Insert server pods | `map` | `{}` | no |
| vm\_insert\_priority\_class\_name | Priority Class Name for VictoriaMetrics Insert server | `string` | `""` | no |
| vm\_insert\_replica\_count | Number of replicas for VictoriaMetrics Insert server | `number` | `2` | no |
| vm\_insert\_resources | Resources for VictoriaMetrics Insert server | `map` | `{}` | no |
| vm\_insert\_security\_context | Security context for VictoriaMetrics Insert server pods defined as a map which will be serialized to JSON. | `map` | `{}` | no |
| vm\_insert\_service\_annotations | Annotations for VictoriaMetrics Insert server service | `map` | `{}` | no |
| vm\_insert\_service\_labels | Labels for VictoriaMetrics Insert server service | `map` | `{}` | no |
| vm\_insert\_service\_port | Service port for VictoriaMetrics Insert server | `number` | `8480` | no |
| vm\_insert\_service\_type | Type of service for VictoriaMetrics Insert server | `string` | `"ClusterIP"` | no |
| vm\_insert\_tolerations | Tolerations for VictoriaMetrics Insert server | `list` | `[]` | no |
| vm\_namespace | Namespace for VictoriaMetrics | `string` | `"core"` | no |
| vm\_psp\_enabled | Enable PodSecurityPolicy in VictoriaMetrics | `bool` | `true` | no |
| vm\_release\_name | Helm release name for VictoriaMetrics | `string` | `"victoria-metrics-cluster"` | no |
| vm\_select\_affinity | Affinity for VictoriaMetrics Select server pods | `map` | `{}` | no |
| vm\_select\_enabled | Deploy VictoriaMetrics Select | `bool` | `true` | no |
| vm\_select\_env | Environment variables for VictoriaMetrics Select | `list` | `[]` | no |
| vm\_select\_extra\_args | Additional VictoriaMetrics Select container arguments | `map` | `{}` | no |
| vm\_select\_image\_repository | Image repository for VictoriaMetrics Select server | `string` | `"victoriametrics/vmselect"` | no |
| vm\_select\_image\_tag | Image tag for VictoriaMetrics Select server | `string` | `"v1.58.0-cluster"` | no |
| vm\_select\_ingress\_annotations | Annotations for VictoriaMetrics Select server ingress | `map` | `{}` | no |
| vm\_select\_ingress\_enabled | Enable ingress for VictoriaMetrics Select server | `bool` | `false` | no |
| vm\_select\_ingress\_hosts | Ingress hosts for VictoriaMetrics Select server | `list` | `[]` | no |
| vm\_select\_node\_selector | Node selector for VictoriaMetrics Select server pods | `map` | `{}` | no |
| vm\_select\_pdb\_min\_available | Min Available PDB for VictoriaMetrics Select server | `number` | `1` | no |
| vm\_select\_pod\_annotations | Annotations for VictoriaMetrics Select server pods | `map` | `{}` | no |
| vm\_select\_priority\_class\_name | Priority Class Name for VictoriaMetrics Select server | `string` | `""` | no |
| vm\_select\_pv\_access\_modes | VictoriaMetrics Select server data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| vm\_select\_pv\_annotations | Annotations for VictoriaMetrics Select server PV | `map` | `{}` | no |
| vm\_select\_pv\_enabled | Enable persistent volume on VictoriaMetrics Select server | `bool` | `true` | no |
| vm\_select\_pv\_size | VictoriaMetrics Select server data Persistent Volume size | `string` | `"8Gi"` | no |
| vm\_select\_replica\_count | Number of replicas for VictoriaMetrics Select server | `number` | `2` | no |
| vm\_select\_resources | Resources for VictoriaMetrics Select server | `map` | `{}` | no |
| vm\_select\_security\_context | Security context for VictoriaMetrics Select server pods defined as a map which will be serialized to JSON | `map` | `{}` | no |
| vm\_select\_service\_annotations | Annotations for VictoriaMetrics Select server service | `map` | `{}` | no |
| vm\_select\_service\_labels | Labels for VictoriaMetrics Select server service | `map` | `{}` | no |
| vm\_select\_service\_port | Service port for VictoriaMetrics Select server | `number` | `8481` | no |
| vm\_select\_service\_type | Type of service for VictoriaMetrics Select server | `string` | `"ClusterIP"` | no |
| vm\_select\_tolerations | Tolerations for VictoriaMetrics Select server | `list` | `[]` | no |
| vm\_service\_account\_annotations | Service Account Annotations for VictoriaMetrics | `map` | `{}` | no |
| vm\_storage\_affinity | Affinity for VictoriaMetrics Storage server pods | `map` | `{}` | no |
| vm\_storage\_enabled | Deploy VictoriaMetrics Storage | `bool` | `true` | no |
| vm\_storage\_env | Environment variables for VictoriaMetrics Storage | `list` | `[]` | no |
| vm\_storage\_extra\_args | Additional VictoriaMetrics Storage container arguments | `map` | `{}` | no |
| vm\_storage\_image\_repository | Image repository for VictoriaMetrics Storage server | `string` | `"victoriametrics/vmstorage"` | no |
| vm\_storage\_image\_tag | Image tag for VictoriaMetrics Storage server | `string` | `"v1.58.0-cluster"` | no |
| vm\_storage\_node\_selector | Node selector for VictoriaMetrics Storage server pods | `map` | `{}` | no |
| vm\_storage\_pdb\_min\_available | Min Available PDB for VictoriaMetrics Storage server | `number` | `1` | no |
| vm\_storage\_pod\_annotations | Annotations for VictoriaMetrics Storage server pods | `map` | `{}` | no |
| vm\_storage\_priority\_class\_name | Priority Class Name for VictoriaMetrics Storage server | `string` | `""` | no |
| vm\_storage\_pv\_access\_modes | VictoriaMetrics Storage server data Persistent Volume access modes | `list` | <pre>[<br>  "ReadWriteOnce"<br>]</pre> | no |
| vm\_storage\_pv\_annotations | Annotations for VictoriaMetrics Storage server PV | `map` | `{}` | no |
| vm\_storage\_pv\_enabled | Enable persistent volume on VictoriaMetrics Storage server | `bool` | `true` | no |
| vm\_storage\_pv\_size | VictoriaMetrics Storage server data Persistent Volume size | `string` | `"8Gi"` | no |
| vm\_storage\_replica\_count | Number of replicas for VictoriaMetrics Storage server | `number` | `2` | no |
| vm\_storage\_resources | Resources for VictoriaMetrics Storage server | `map` | `{}` | no |
| vm\_storage\_retention\_period | VictoriaMetrics Storage data retention period in months | `number` | `1` | no |
| vm\_storage\_security\_context | Security context for VictoriaMetrics Storage server pods defined as a map which will be serialized to JSON | `map` | `{}` | no |
| vm\_storage\_service\_annotations | Annotations for VictoriaMetrics Storage server service | `map` | `{}` | no |
| vm\_storage\_service\_labels | Labels for VictoriaMetrics Storage server service | `map` | `{}` | no |
| vm\_storage\_service\_port | Service port for VictoriaMetrics Storage server | `number` | `8482` | no |
| vm\_storage\_termination\_grace\_period\_seconds | VictoriaMetrics Select server pods' termination grace period in seconds | `number` | `60` | no |
| vm\_storage\_tolerations | Tolerations for VictoriaMetrics Storage server | `list` | `[]` | no |
| vm\_storage\_vm\_insert\_port | Service port for for accepting connections from vminsert | `number` | `8400` | no |
| vm\_storage\_vm\_select\_port | Service port for for accepting connections from vmselect | `number` | `8401` | no |

## Outputs

| Name | Description |
|------|-------------|
| alerts\_api\_url | Alerts API URL |
| remote\_read\_api\_url | URL for remote reading |
| remote\_write\_api\_url | URL for remote writing |
