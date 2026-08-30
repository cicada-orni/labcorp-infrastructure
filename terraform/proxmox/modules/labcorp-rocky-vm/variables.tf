variable "vm_name" {
  type        = string
  description = "Name assigned to the Proxmox virtual machine."
}

variable "vm_id" {
  type        = number
  default     = null
  description = "Optional VM ID. When omitted, the provider allocates one."
}

variable "node_name" {
  type        = string
  description = "Proxmox node where the virtual machine will be created."
}

variable "pool_id" {
  type        = string
  description = "Proxmox resource pool that will contain the virtual machine."
}

variable "compute" {
  type = object({
    cores     = number
    memory_mb = number
  })

  description = "CPU and memory assigned to the virtual machine."
}

variable "disk" {
  type = object({
    source_file_id = string
    datastore_id   = string
    size_gb        = number
  })

  description = "Boot disk configuration for the virtual machine."
}

variable "network" {
  type = object({
    bridge  = string
    vlan_id = number
  })

  description = "Network connection assigned to the virtual machine."
}

variable "ipv4" {
  type = object({
    address = string
    gateway = string
  })
  description = "Static IPv4 configuration assigned though cloud-init."
}

variable "dns" {
  type = object({
    servers = list(string)

  })

  description = "DNS resolvers assigned to the virtual machine though cloud-init."
}

variable "user_account" {
  type = object({
    username        = string
    ssh_public_keys = list(string)
  })
  description = "Initial Linux user and SSH public keys configured though cloud-init."
}

variable "vendor_data_file_id" {
  type        = string
  description = "Proxmox snippet file ID containing Cloud-init vendor data."
}
