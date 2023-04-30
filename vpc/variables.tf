variable "project_id" {
  type        = string
  description = "Project's ID"
  default     = ""
}

variable "project_region" {
  type        = string
  description = "Project's Region"
  default     = ""
}

variable "project_zone" {
  type        = string
  description = "Project's Zone"
  default     = ""
}

variable "second_admin" {
  type        = set(string)
  description = "Secondary Admin"
  default     = []
}
