###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
  default     = "personal"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
  default     = "personal"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = "personal"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "org" {
  type        = string
  default     = "netology"
}



variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_name" {
  type        = string
  default     = "platform-web"
  description = "vm name"
}


variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "image family"
}



variable "vm_web_resources" {
 type         = map 
 default      = { 
    cores         = 2
    memory        = 1
    core_fraction = 5
 }
}
variable "vm_db_resources" {
 type         = map 
 default      = { 
    cores         = 2
    memory        = 2
    core_fraction = 20
 } 
}
variable "vms_resources" {
type         = map 
default = {
    web = {
      platform_id = "standard-v1"
      cores         = 2
      memory        = 1
      core_fraction = 5
    }
    db = {
      platform_id ="standard-v1"
      cores         = 2
      memory        = 2
      core_fraction = 20
    }
    preemptible = {
      value = true
    }
   }
}

variable "metadata" {
  type = map
  default = {}
}


###ssh vars

#variable "vms_ssh_root_key" {
#  type        = string
#  default     = "personal"
#  description = "ssh-keygen -t ed25519"
#}

 