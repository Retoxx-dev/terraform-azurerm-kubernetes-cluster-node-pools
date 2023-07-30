module "kubernetes-cluster-node-pools" {
  source  = "Retoxx-dev/kubernetes-cluster-node-pools/azurerm"
  version = "1.0.0"

  kubernetes_cluster_id = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/group1/providers/Microsoft.ContainerService/managedClusters/cluster1"

  node_pools = [
    {
      name                 = "dev"
      vnet_subnet_id       = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
      vm_size              = "standard_B1s"
      min_count            = 1
      max_count            = 3
      os_disk_size_gb      = 128
      os_disk_type         = "Managed"
      max_pods             = 30
      priority             = "Spot"
      orchestrator_version = "1.26.3"
      node_labels = {
        "env" = "dev"
      }
      node_taints = ["env=dev:NoSchedule"]
    },
    {
      name                 = "staging"
      vnet_subnet_id       = "/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/mygroup1/providers/Microsoft.Network/virtualNetworks/myvnet1/subnets/mysubnet1"
      vm_size              = "standard_B1s"
      min_count            = 2
      max_count            = 2
      os_disk_size_gb      = 128
      os_disk_type         = "Managed"
      max_pods             = 30
      priority             = "Spot"
      orchestrator_version = "1.26.3"
      node_labels = {
        "env" = "staging"
      }
      node_taints = ["env=staging:NoSchedule"]
    }
  ]
}