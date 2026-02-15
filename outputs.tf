output "id" {
  value       = proxmox_virtual_environment_download_file.this.id
  description = "The unique identifier of the downloaded file"
}

output "file_name" {
  value       = proxmox_virtual_environment_download_file.this.file_name
  description = "The name of the downloaded file"
}

output "datastore_id" {
  value       = proxmox_virtual_environment_download_file.this.datastore_id
  description = "The datastore ID where the file was uploaded"
}
