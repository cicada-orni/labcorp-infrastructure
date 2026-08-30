resource "proxmox_virtual_environment_vm" "vm" {
  name          = var.vm_name
  vm_id         = var.vm_id
  node_name     = var.node_name
  pool_id       = var.pool_id
  scsi_hardware = "virtio-scsi-pci"
  boot_order    = ["scsi0"]
  agent {
    enabled = true
  }

  serial_device {
    device = "socket"
  }

  vga {
    type = "serial0"
  }
  cpu {
    cores = var.compute.cores
    type  = "host"
  }

  memory {
    dedicated = var.compute.memory_mb
  }

  operating_system {
    type = "l26"
  }

  disk {
    datastore_id = var.disk.datastore_id
    import_from  = var.disk.source_file_id
    interface    = "scsi0"
    size         = var.disk.size_gb
  }

  network_device {
    model   = "virtio"
    bridge  = var.network.bridge
    vlan_id = var.network.vlan_id
  }

  initialization {
    datastore_id        = var.disk.datastore_id
    interface           = "ide2"
    vendor_data_file_id = var.vendor_data_file_id
    dns {
      servers = var.dns.servers
    }

    ip_config {
      ipv4 {
        address = var.ipv4.address
        gateway = var.ipv4.gateway
      }
    }

    user_account {
      username = var.user_account.username
      keys     = var.user_account.ssh_public_keys
    }
  }
}
