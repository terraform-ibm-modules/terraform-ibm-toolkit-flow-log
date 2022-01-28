
variable "resource_group_id" {
  type        = string
  description = "The id of the resource group where the flow logs will be provisioned"
}

variable "cos_bucket_name" {
  type        = string
  description = "Cloud Object Storage bucket name for flow logs"
}

variable "target_count" {
  type        = number
  description = "The number of resources for which flow logs will be created"
  default     = 0
}

variable "target_ids" {
  type        = list(string)
  description = "The ids of the target resources for the flow log"
}

variable "target_names" {
  type        = list(string)
  description = "The names of the target resources for the flow logs"
}

variable "auth_id" {
  type        = string
  description = "The id of the service authorization that allows the flow log to write to the cos bucket"
  default     = ""
}

variable "provision" {
  type        = bool
  description = "Flag indicating that the subnet should be provisioned. If 'false' then the subnet will be looked up."
  default     = true
}
