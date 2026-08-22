resource "proxmox_virtual_environment_pool" "services" {
  pool_id = "labcorp-services"
  comment = "LabCorp durable service virtual machines managed by Terraform"
}
