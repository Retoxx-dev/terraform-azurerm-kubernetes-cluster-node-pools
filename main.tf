#################################################################
# AZURE KUBERNETES CLUSTER NODE POOLS
#################################################################

resource "azurerm_kubernetes_cluster_node_pool" "this" {
  for_each = { for pool in var.node_pools : pool.name => pool }

  kubernetes_cluster_id = var.kubernetes_cluster_id

  name                          = each.value.name
  vm_size                       = each.value.vm_size
  capacity_reservation_group_id = each.value.capacity_reservation_group_id
  custom_ca_trust_enabled       = each.value.custom_ca_trust_enabled
  enable_auto_scaling           = each.value.min_count == each.value.max_count ? false : true
  enable_host_encryption        = each.value.enable_host_encryption
  enable_node_public_ip         = each.value.enable_node_public_ip
  eviction_policy               = each.value.eviction_policy
  host_group_id                 = each.value.host_group_id

  dynamic "kubelet_config" {
    for_each = each.value.kubelet_config != null ? [each.value.kubelet_config] : []
    content {
      allowed_unsafe_sysctls    = each.value.allowed_unsafe_sysctls
      container_log_max_line    = each.value.container_log_max_line
      container_log_max_size_mb = each.value.container_log_max_size_mb
      cpu_cfs_quota_enabled     = each.value.cpu_cfs_quota_enabled
      cpu_cfs_quota_period      = each.value.cpu_cfs_quota_period
      cpu_manager_policy        = each.value.cpu_manager_policy
      image_gc_high_threshold   = each.value.image_gc_high_threshold
      image_gc_low_threshold    = each.value.image_gc_low_threshold
      pod_max_pid               = each.value.pod_max_pid
      topology_manager_policy   = each.value.topology_manager_policy
    }
  }

  dynamic "linux_os_config" {
    for_each = each.value.linux_os_config != null ? [each.value.linux_os_config] : []
    content {
      swap_file_size_mb = linux_os_config.value.swap_file_size_mb

      dynamic "sysctl_config" {
        for_each = linux_os_config.value.sysctl_config != null ? [linux_os_config.value.sysctl_config] : []
        content {
          fs_aio_max_nr                      = sysctl_config.value.fs_aio_max_nr
          fs_file_max                        = sysctl_config.value.fs_file_max
          fs_inotify_max_user_watches        = sysctl_config.value.fs_inotify_max_user_watches
          fs_nr_open                         = sysctl_config.value.fs_nr_open
          kernel_threads_max                 = sysctl_config.value.kernel_threads_max
          net_core_netdev_max_backlog        = sysctl_config.value.net_core_netdev_max_backlog
          net_core_optmem_max                = sysctl_config.value.net_core_optmem_max
          net_core_rmem_default              = sysctl_config.value.net_core_rmem_default
          net_core_rmem_max                  = sysctl_config.value.net_core_rmem_max
          net_core_somaxconn                 = sysctl_config.value.net_core_somaxconn
          net_core_wmem_default              = sysctl_config.value.net_core_wmem_default
          net_core_wmem_max                  = sysctl_config.value.net_core_wmem_max
          net_ipv4_ip_local_port_range_max   = sysctl_config.value.net_ipv4_ip_local_port_range_max
          net_ipv4_ip_local_port_range_min   = sysctl_config.value.net_ipv4_ip_local_port_range_min
          net_ipv4_neigh_default_gc_thresh1  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh1
          net_ipv4_neigh_default_gc_thresh2  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh2
          net_ipv4_neigh_default_gc_thresh3  = sysctl_config.value.net_ipv4_neigh_default_gc_thresh3
          net_ipv4_tcp_fin_timeout           = sysctl_config.value.net_ipv4_tcp_fin_timeout
          net_ipv4_tcp_keepalive_intvl       = sysctl_config.value.net_ipv4_tcp_keepalive_intvl
          net_ipv4_tcp_keepalive_probes      = sysctl_config.value.net_ipv4_tcp_keepalive_probes
          net_ipv4_tcp_keepalive_time        = sysctl_config.value.net_ipv4_tcp_keepalive_time
          net_ipv4_tcp_max_syn_backlog       = sysctl_config.value.net_ipv4_tcp_max_syn_backlog
          net_ipv4_tcp_max_tw_buckets        = sysctl_config.value.net_ipv4_tcp_max_tw_buckets
          net_ipv4_tcp_tw_reuse              = sysctl_config.value.net_ipv4_tcp_tw_reuse
          net_netfilter_nf_conntrack_buckets = sysctl_config.value.net_netfilter_nf_conntrack_buckets
          net_netfilter_nf_conntrack_max     = sysctl_config.value.net_netfilter_nf_conntrack_max
          vm_max_map_count                   = sysctl_config.value.vm_max_map_count
          vm_swappiness                      = sysctl_config.value.vm_swappiness
          vm_vfs_cache_pressure              = sysctl_config.value.vm_vfs_cache_pressure
        }
      }

      transparent_huge_page_defrag  = linux_os_config.value.transparent_huge_page_defrag
      transparent_huge_page_enabled = linux_os_config.value.transparent_huge_page_enabled
    }
  }

  fips_enabled       = each.value.fips_enabled
  kubelet_disk_type  = each.value.kubelet_disk_type
  max_pods           = each.value.max_pods
  message_of_the_day = each.value.message_of_the_day
  mode               = each.value.mode

  dynamic "node_network_profile" {
    for_each = each.value.node_network_profile != null ? [each.value.node_network_profile] : []
    content {
      node_public_ip_tags = node_network_profile.value.node_public_ip_tags
    }
  }

  node_labels                  = each.value.priority == "Spot" ? merge(each.value.node_labels, { "kubernetes.azure.com/scalesetpriority" = "spot" }) : each.value.node_labels
  node_public_ip_prefix_id     = each.value.node_public_ip_prefix_id
  node_taints                  = each.value.priority == "Spot" ? concat(["kubernetes.azure.com/scalesetpriority=spot:NoSchedule"], each.value.node_taints) : each.value.node_taints
  orchestrator_version         = each.value.orchestrator_version
  os_disk_size_gb              = each.value.os_disk_size_gb
  os_disk_type                 = each.value.os_disk_type
  pod_subnet_id                = each.value.pod_subnet_id
  os_sku                       = each.value.os_sku
  os_type                      = each.value.os_type
  priority                     = each.value.priority
  proximity_placement_group_id = each.value.proximity_placement_group_id
  spot_max_price               = each.value.priority == "Spot" ? each.value.spot_max_price : null
  snapshot_id                  = each.value.snapshot_id
  tags                         = each.value.tags
  scale_down_mode              = each.value.scale_down_mode
  ultra_ssd_enabled            = each.value.ultra_ssd_enabled

  dynamic "upgrade_settings" {
    for_each = each.value.upgrade_settings != null ? [each.value.upgrade_settings] : []
    content {
      max_surge = upgrade_settings.value.max_surge
    }
  }

  vnet_subnet_id = each.value.vnet_subnet_id

  dynamic "windows_profile" {
    for_each = each.value.windows_profile != null ? [each.value.windows_profile] : []
    content {
      outbound_nat_enabled = windows_profile.value.outbound_nat_enabled
    }
  }

  workload_runtime = each.value.workload_runtime
  zones            = each.value.zones
  max_count        = each.value.max_count
  min_count        = each.value.min_count
  node_count       = each.value.min_count == each.value.max_count ? each.value.min_count : null
}