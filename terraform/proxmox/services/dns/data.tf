data "proxmox_file" "rocky_bootstrap" {
  node_name    = "pve-node01"
  datastore_id = "local"
  content_type = "snippets"
  file_name    = "labcorp-rocky-bootstrap.yaml"
}

data "proxmox_file" "rocky_10_cloud_image" {
  node_name    = "pve-node01"
  datastore_id = "local"
  content_type = "import"
  file_name    = "Rocky-10-GenericCloud-Base-10.2-20260525.0.x86_64.qcow2"
}
