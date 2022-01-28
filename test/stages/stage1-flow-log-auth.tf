module "flow_log_auth" {
  source = "github.com/cloud-native-toolkit/terraform-ibm-iam-service-authorization"

  ibmcloud_api_key = var.ibmcloud_api_key
  source_service_name = "is"
  source_resource_type = "flow-log-collector"
  provision = true
  target_service_name = "cloud-object-storage"
  target_resource_group_id = module.resource_group.id
  roles = ["Writer"]
}
