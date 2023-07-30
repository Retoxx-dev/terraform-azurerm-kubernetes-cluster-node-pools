# terraform-azurerm-kubernetes-cluster-node-pools

## Create Azure Kubernetes Service node pools
With this module you can create multiple aks node pools in a single cluster.

## Usage
For usage examples, checkout the [examples](examples/) directory.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster_node_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#input\_kubernetes\_cluster\_id) | The ID of the Kubernetes Cluster in which to create the Node Pool. | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | A list of Kubernetes Cluster Node Pools to create in the specified Kubernetes Cluster. | <pre>list(object({<br>    name                                = string<br>    vm_size                             = string<br>    capacity_reservation_group_id       = optional(string, null)<br>    custom_ca_trust_enabled             = optional(bool, null)<br>    custom_ca_trust_certificates_base64 = optional(list(string), null)<br>    enable_host_encryption              = optional(bool, null)<br>    enable_node_public_ip               = optional(bool, null)<br>    eviction_policy               = optional(string, null)<br>    host_group_id                 = optional(string, null)<br><br>    kubelet_config = optional(object({<br>      allowed_unsafe_sysctls          = optional(list(string), null)<br>      container_log_max_line          = optional(number, null)<br>      container_log_max_size_mb       = optional(number, null)<br>      cpu_cfs_quota_enabled           = optional(bool, null)<br>      cpu_cfs_quota_period            = optional(string, null)<br>      cpu_manager_policy              = optional(string, null)<br>      image_gc_high_threshold_percent = optional(number, null)<br>      image_gc_high_threshold         = optional(string, null)<br>      image_gc_low_threshold          = optional(string, null)<br>      pod_max_pid                     = optional(number, null)<br>      topology_manager_policy         = optional(string, null)<br>    }), null)<br><br>    linux_os_config = optional(object({<br>      swap_file_size_mb = optional(number, null)<br>      sysctl_config = optional(object({<br>        fs_aio_max_nr                      = optional(number, null)<br>        fs_file_max                        = optional(number, null)<br>        fs_inotify_max_user_watches        = optional(number, null)<br>        fs_nr_open                         = optional(number, null)<br>        kernel_threads_max                 = optional(number, null)<br>        net_core_netdev_max_backlog        = optional(number, null)<br>        net_core_optmem_max                = optional(number, null)<br>        net_core_rmem_default              = optional(number, null)<br>        net_core_rmem_max                  = optional(number, null)<br>        net_core_somaxconn                 = optional(number, null)<br>        net_core_wmem_default              = optional(number, null)<br>        net_core_wmem_max                  = optional(number, null)<br>        net_ipv4_ip_local_port_range_max   = optional(number, null)<br>        net_ipv4_ip_local_port_range_min   = optional(number, null)<br>        net_ipv4_neigh_default_gc_thresh1  = optional(number, null)<br>        net_ipv4_neigh_default_gc_thresh2  = optional(number, null)<br>        net_ipv4_neigh_default_gc_thresh3  = optional(number, null)<br>        net_ipv4_tcp_fin_timeout           = optional(number, null)<br>        net_ipv4_tcp_keepalive_intvl       = optional(number, null)<br>        net_ipv4_tcp_keepalive_probes      = optional(number, null)<br>        net_ipv4_tcp_keepalive_time        = optional(number, null)<br>        net_ipv4_tcp_max_syn_backlog       = optional(number, null)<br>        net_ipv4_tcp_max_tw_buckets        = optional(number, null)<br>        net_ipv4_tcp_tw_reuse              = optional(number, null)<br>        net_netfilter_nf_conntrack_buckets = optional(number, null)<br>        net_netfilter_nf_conntrack_max     = optional(number, null)<br>        vm_max_map_count                   = optional(number, null)<br>        vm_swappiness                      = optional(number, null)<br>        vm_vfs_cache_pressure              = optional(number, null)<br>      }))<br>      transparent_huge_page_defrag  = optional(string, null)<br>      transparent_huge_page_enabled = optional(string, null)<br>    }), null)<br><br>    fips_enabled       = optional(bool, null)<br>    kubelet_disk_type  = optional(string, null)<br>    max_pods           = optional(number, null)<br>    message_of_the_day = optional(string, null)<br>    mode               = optional(string, null)<br><br>    node_network_profile = optional(object({<br>      node_public_ip_tags = optional(map(string), null)<br>    }), null)<br><br>    node_labels                  = optional(map(string), null)<br>    node_public_ip_prefix_id     = optional(string, null)<br>    node_taints                  = optional(list(string), null)<br>    orchestrator_version         = optional(string, null)<br>    os_disk_size_gb              = optional(number, null)<br>    os_disk_type                 = optional(string, null)<br>    pod_subnet_id                = optional(string, null)<br>    os_sku                       = optional(string, null)<br>    os_type                      = optional(string, null)<br>    priority                     = optional(string, null)<br>    proximity_placement_group_id = optional(string, null)<br>    spot_max_price               = optional(number, null)<br>    snapshot_id                  = optional(string, null)<br>    tags                         = optional(map(string), null)<br>    scale_down_mode              = optional(string, null)<br>    ultra_ssd_enabled            = optional(bool, null)<br><br>    upgrade_settings = optional(object({<br>      max_surge = optional(number, null)<br>    }), null)<br><br>    vnet_subnet_id = optional(string, null)<br><br>    windows_profile = optional(object({<br>      outbound_nat_enabled = optional(bool, null)<br>    }), null)<br><br>    workload_runtime = optional(string, null)<br>    zones            = optional(list(string), null)<br>    max_count        = optional(number, null)<br>    min_count        = optional(number, null)<br>    node_count       = optional(number, null)<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_node_pools_ids"></a> [node\_pools\_ids](#output\_node\_pools\_ids) | The IDs of the Kubernetes Node Pools. |
<!-- END_TF_DOCS -->