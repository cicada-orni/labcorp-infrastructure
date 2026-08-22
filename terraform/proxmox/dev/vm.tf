resource "proxmox_virtual_environment_vm" "tf_dev01" {
  name       = "tf-dev01"
  node_name  = "pve-node01"
  pool_id    = data.proxmox_virtual_environment_pool.terraform_dev.pool_id
  vm_id      = 102
  started    = true
  on_boot    = false
  boot_order = ["scsi0"]

  cpu {
    cores = 2
    type  = "host"
  }

  serial_device {
    device = "socket"
  }

  vga {
    type = "serial0"
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 20
    import_from  = data.proxmox_file.rocky_10_cloud_image.id
  }

  scsi_hardware = "virtio-scsi-single"

  network_device {
    bridge  = "vmbr0"
    model   = "virtio"
    vlan_id = 30
  }

  operating_system {
    type = "l26"
  }

  initialization {
    datastore_id = "local-lvm"
    interface    = "ide2"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

    user_account {
      username = "faisal"
      keys     = [trimspace(file(pathexpand("~/.ssh/id_ed25519_labcorp_vm_ops-control01.pub")))]
    }
  }


}
