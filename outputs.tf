output "count" {
  value       = var.provision ? var.target_count : 0
  description = "The number of flow logs created"
}

output "ids" {
  value       = ibm_is_flow_log.flowlog_instance[*].id
  description = "The ids of the generated flow logs"
}

output "names" {
  value       = ibm_is_flow_log.flowlog_instance[*].name
  description = "The names of the generated flow logs"
}
