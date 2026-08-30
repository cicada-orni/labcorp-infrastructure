provider "proxmox" {
  endpoint = "https://10.50.10.2:8006/"

  insecure = true

  ssh {
    agent    = true
    username = "terraform-pve"
  }
}
