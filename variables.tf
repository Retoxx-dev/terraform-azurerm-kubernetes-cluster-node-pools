#################################################################
# AZURE KUBERNETES CLUSTER NODE POOLS
#################################################################
variable "kubernetes_cluster_id" {
  type        = string
  description = "The ID of the Kubernetes Cluster in which to create the Node Pool."
}


variable "node_pools" {
  type = list(object({
    name                                = string
    vm_size                             = string
    capacity_reservation_group_id       = optional(string, null)
    custom_ca_trust_enabled             = optional(bool, null)
    custom_ca_trust_certificates_base64 = optional(list(string), null)
    enable_host_encryption              = optional(bool, null)
    enable_node_public_ip               = optional(bool, null)
    eviction_policy               = optional(string, null)
    host_group_id                 = optional(string, null)

    kubelet_config = optional(object({
      allowed_unsafe_sysctls          = optional(list(string), null)
      container_log_max_line          = optional(number, null)
      container_log_max_size_mb       = optional(number, null)
      cpu_cfs_quota_enabled           = optional(bool, null)
      cpu_cfs_quota_period            = optional(string, null)
      cpu_manager_policy              = optional(string, null)
      image_gc_high_threshold_percent = optional(number, null)
      image_gc_high_threshold         = optional(string, null)
      image_gc_low_threshold          = optional(string, null)
      pod_max_pid                     = optional(number, null)
      topology_manager_policy         = optional(string, null)
    }), null)

    linux_os_config = optional(object({
      swap_file_size_mb = optional(number, null)
      sysctl_config = optional(object({
        fs_aio_max_nr                      = optional(number, null)
        fs_file_max                        = optional(number, null)
        fs_inotify_max_user_watches        = optional(number, null)
        fs_nr_open                         = optional(number, null)
        kernel_threads_max                 = optional(number, null)
        net_core_netdev_max_backlog        = optional(number, null)
        net_core_optmem_max                = optional(number, null)
        net_core_rmem_default              = optional(number, null)
        net_core_rmem_max                  = optional(number, null)
        net_core_somaxconn                 = optional(number, null)
        net_core_wmem_default              = optional(number, null)
        net_core_wmem_max                  = optional(number, null)
        net_ipv4_ip_local_port_range_max   = optional(number, null)
        net_ipv4_ip_local_port_range_min   = optional(number, null)
        net_ipv4_neigh_default_gc_thresh1  = optional(number, null)
        net_ipv4_neigh_default_gc_thresh2  = optional(number, null)
        net_ipv4_neigh_default_gc_thresh3  = optional(number, null)
        net_ipv4_tcp_fin_timeout           = optional(number, null)
        net_ipv4_tcp_keepalive_intvl       = optional(number, null)
        net_ipv4_tcp_keepalive_probes      = optional(number, null)
        net_ipv4_tcp_keepalive_time        = optional(number, null)
        net_ipv4_tcp_max_syn_backlog       = optional(number, null)
        net_ipv4_tcp_max_tw_buckets        = optional(number, null)
        net_ipv4_tcp_tw_reuse              = optional(number, null)
        net_netfilter_nf_conntrack_buckets = optional(number, null)
        net_netfilter_nf_conntrack_max     = optional(number, null)
        vm_max_map_count                   = optional(number, null)
        vm_swappiness                      = optional(number, null)
        vm_vfs_cache_pressure              = optional(number, null)
      }))
      transparent_huge_page_defrag  = optional(string, null)
      transparent_huge_page_enabled = optional(string, null)
    }), null)

    fips_enabled       = optional(bool, null)
    kubelet_disk_type  = optional(string, null)
    max_pods           = optional(number, null)
    message_of_the_day = optional(string, null)
    mode               = optional(string, null)

    node_network_profile = optional(object({
      node_public_ip_tags = optional(map(string), null)
    }), null)

    node_labels                  = optional(map(string), null)
    node_public_ip_prefix_id     = optional(string, null)
    node_taints                  = optional(list(string), null)
    orchestrator_version         = optional(string, null)
    os_disk_size_gb              = optional(number, null)
    os_disk_type                 = optional(string, null)
    pod_subnet_id                = optional(string, null)
    os_sku                       = optional(string, null)
    os_type                      = optional(string, null)
    priority                     = optional(string, null)
    proximity_placement_group_id = optional(string, null)
    spot_max_price               = optional(number, null)
    snapshot_id                  = optional(string, null)
    tags                         = optional(map(string), null)
    scale_down_mode              = optional(string, null)
    ultra_ssd_enabled            = optional(bool, null)

    upgrade_settings = optional(object({
      max_surge = optional(number, null)
    }), null)

    vnet_subnet_id = optional(string, null)

    windows_profile = optional(object({
      outbound_nat_enabled = optional(bool, null)
    }), null)

    workload_runtime = optional(string, null)
    zones            = optional(list(string), null)
    max_count        = optional(number, null)
    min_count        = optional(number, null)
    node_count       = optional(number, null)
  }))
  description = "A list of Kubernetes Cluster Node Pools to create in the specified Kubernetes Cluster."
}