module "dns01" {
  source = "../../modules/labcorp-rocky-vm/"

  vm_name   = "dns01"
  node_name = "pve-node01"
  pool_id   = "labcorp-services"

  compute = {
    cores     = 2
    memory_mb = 2048
  }

  disk = {
    source_file_id = data.proxmox_file.rocky_10_cloud_image.id
    datastore_id   = "local-lvm"
    size_gb        = 20
  }

  network = {
    bridge  = "vmbr0"
    vlan_id = 20
  }

  ipv4 = {
    address = "10.50.20.10/24"
    gateway = "10.50.20.1"
  }

  dns = {
    servers = ["10.50.20.1"]
  }

  user_account = {
    username = "faisal"
    ssh_public_keys = [
      trimspace(file(pathexpand("~/.ssh/id_ed25519_labcorp_vm_ops-control01.pub")))
    ]
  }



  vendor_data_file_id = data.proxmox_file.rocky_bootstrap.id
}
