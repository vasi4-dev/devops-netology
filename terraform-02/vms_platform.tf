

variable "vm_db_name" {
  type        = string
  default     = "platform-db"
  description = "vm name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "plaform_id"
}


variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "vm memory"
}


variable "vm_db_fraction" {
  type        = number
  default     = 20
  description = "vm cpu core fraction"
}


variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "vm cpu core number"
}


