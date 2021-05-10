resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo 'Storage bucket name: ${var.cos_bucket_name}'"
  }
  provisioner "local-exec" {
    command = "echo 'Auth policy id: ${var.auth_id}'"
  }
}

resource ibm_is_flow_log flowlog_instance {
  depends_on     = [null_resource.print_names]
  count          = var.provision ? var.target_count : 0

  name           = "${var.target_names[count.index]}-flowlog"
  target         = var.target_ids[count.index]
  active         = true
  resource_group = var.resource_group_id
  storage_bucket = var.cos_bucket_name
}
