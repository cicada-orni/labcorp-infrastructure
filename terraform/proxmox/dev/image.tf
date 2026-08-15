resource "proxmox_download_file" "rocky_10_cloud_image" {
  content_type       = "import"
  datastore_id       = "local"
  file_name          = "Rocky-10-GenericCloud-Base-10.2-20260525.0.x86_64.qcow2"
  node_name          = "pve-node01"
  url                = "https://dl.rockylinux.org/pub/rocky/10/images/x86_64/Rocky-10-GenericCloud-Base-10.2-20260525.0.x86_64.qcow2"
  checksum           = "9fc9e9ff16888bb68ac39b0392e25c9c92684d50c85f1cce6ab549363bbc4b48"
  checksum_algorithm = "sha256"
}
