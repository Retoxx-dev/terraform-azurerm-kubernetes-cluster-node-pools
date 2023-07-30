output "node_pools_ids" {
  value       = { for pool in azurerm_kubernetes_cluster_node_pool.this : pool.name => pool.id }
  description = "The IDs of the Kubernetes Node Pools."
}