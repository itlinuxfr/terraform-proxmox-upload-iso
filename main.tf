# Download ISO Image into Proxmox
resource "proxmox_virtual_environment_download_file" "this" {
  content_type = "iso"
  datastore_id = var.proxmox_iso_storage
  file_name    = var.proxmox_iso_name
  node_name    = var.proxmox_node
  url          = var.proxmox_iso_url

  # Optional Configuration
  checksum           = var.proxmox_iso_checksum
  checksum_algorithm = var.proxmox_iso_checksum != null ? var.proxmox_iso_checksum_algorithm : null
  overwrite          = var.proxmox_upload_overwrite
}
