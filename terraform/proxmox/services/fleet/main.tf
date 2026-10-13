module "servers" {
  source   = "../../modules/labcorp-rocky-vm"
  for_each = var.servers

  vm_name   = each.key
  node_name = "pve-node01"
  pool_id   = "labcorp-services"

  network = {
    bridge  = "vmbr0"
    vlan_id = each.value.vlan_id

  }

  dns = {
    servers = each.value.dns_servers
    domain  = var.dns_domain
  }

  ipv4 = {
    address = "${each.value.ipv4_address}/24"
    gateway = each.value.ipv4_gateway
  }

  compute = {
    cores     = each.value.cores
    memory_mb = each.value.memory_mb
  }
  disk = {
    source_file_id = data.proxmox_file.rocky_10_cloud_image.id
    datastore_id   = each.value.disk_datastore_id
    size_gb        = each.value.disk_size_gb
  }

  user_account = {
    username        = "faisal"
    ssh_public_keys = [trimspace(file(pathexpand("~/.ssh/id_ed25519_labcorp_vm_ops-control01.pub")))]
  }

  vendor_data_file_id = data.proxmox_file.rocky_bootstrap.id
}
