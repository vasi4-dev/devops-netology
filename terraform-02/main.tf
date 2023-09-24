resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

resource "yandex_compute_instance" "platform" {
  name = local.vmname_web 
  platform_id = var.vms_resources.web.platform_id

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
    }
  boot_disk {
  initialize_params {
    image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.preemptible.value
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }      
  metadata = var.metadata 
   }
resource "yandex_compute_instance" "platform-db" {
  name = local.vmname_db
  platform_id = var.vms_resources.db.platform_id

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
    }
  boot_disk {
  initialize_params {
    image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources.preemptible.value
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }      
  metadata = var.metadata 
   }   
