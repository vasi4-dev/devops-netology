  output "web-ip" {
  value = {
    instance_name = yandex_compute_instance.platform.name 
    external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    }
  }

   output "db-ip" {
   value = {
   instance_name = yandex_compute_instance.platform-db.name 
   external_ip   = yandex_compute_instance.platform-db.network_interface.0.nat_ip_address
   }

  }

