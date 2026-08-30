resource "proxmox_virtual_environment_file" "rocky_bootstrap" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "pve-node01"
  upload_mode  = "stream"

  source_file {
    path      = "${path.module}/files/cloud-init/labcorp-rocky-bootstrap.yaml"
    file_name = "labcorp-rocky-bootstrap.yaml"
  }
}
