variable "servers" {
  description = "Labcorp servers managed by this fleet."
  type = map(object({
    ipv4_address      = string
    ipv4_gateway      = string
    dns_servers       = list(string)
    vlan_id           = number
    cores             = number
    memory_mb         = number
    disk_datastore_id = string
    disk_size_gb      = number
  }))
}

variable "dns_domain" {
  type        = string
  description = "DNS search domain used by the fleet."
}
