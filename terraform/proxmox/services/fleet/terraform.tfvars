servers = {
  dns02 = {
    ipv4_address      = "10.50.20.11"
    ipv4_gateway      = "10.50.20.1"
    dns_servers       = ["10.50.20.1"]
    vlan_id           = 20
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20

  }

  intranet01 = {
    ipv4_address      = "10.50.20.20"
    ipv4_gateway      = "10.50.20.1"
    dns_servers       = ["10.50.20.1"]
    vlan_id           = 20
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  web01 = {
    ipv4_address      = "10.50.40.10"
    ipv4_gateway      = "10.50.40.1"
    dns_servers       = ["10.50.40.1"]
    vlan_id           = 40
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  hr-app01 = {
    ipv4_address      = "10.50.20.21"
    ipv4_gateway      = "10.50.20.1"
    dns_servers       = ["10.50.20.1"]
    vlan_id           = 20
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  finance-app01 = {
    ipv4_address      = "10.50.20.22"
    ipv4_gateway      = "10.50.20.1"
    dns_servers       = ["10.50.20.1"]
    vlan_id           = 20
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  db01 = {
    ipv4_address      = "10.50.20.30"
    ipv4_gateway      = "10.50.20.1"
    dns_servers       = ["10.50.20.1"]
    vlan_id           = 20
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  files01 = {
    ipv4_address      = "10.50.20.40"
    ipv4_gateway      = "10.50.20.1"
    dns_servers       = ["10.50.20.1"]
    vlan_id           = 20
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  monitor01 = {
    ipv4_address      = "10.50.10.20"
    ipv4_gateway      = "10.50.10.1"
    dns_servers       = ["10.50.10.1"]
    vlan_id           = 10
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  logs01 = {
    ipv4_address      = "10.50.10.21"
    ipv4_gateway      = "10.50.10.1"
    dns_servers       = ["10.50.10.1"]
    vlan_id           = 10
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }

  backup01 = {
    ipv4_address      = "10.50.10.22"
    ipv4_gateway      = "10.50.10.1"
    dns_servers       = ["10.50.10.1"]
    vlan_id           = 10
    cores             = 2
    memory_mb         = 2048
    disk_datastore_id = "local-lvm"
    disk_size_gb      = 20
  }
}

dns_domain = "labcorp.internal"
