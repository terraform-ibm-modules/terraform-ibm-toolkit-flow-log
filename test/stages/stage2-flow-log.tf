module "flow_log" {
  source = "./module"

  resource_group_id = module.resource_group.id
  cos_bucket_name   = module.cos_bucket.bucket_name
  target_count      = module.vpc.count
  target_ids        = module.vpc.ids
  target_names      = module.vpc.names
  auth_id           = module.flow_log_auth.id
}
