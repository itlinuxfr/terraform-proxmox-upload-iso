variable "proxmox_node" {
  type        = string
  description = "Target Proxmox Node Name"
  validation {
    condition     = length(var.proxmox_node) > 0
    error_message = "Proxmox node name must not be empty."
  }
}

variable "proxmox_iso_storage" {
  type        = string
  description = "Proxmox Storage ID for ISOs (e.g., 'local', 'cephfs')"
  validation {
    condition     = length(var.proxmox_iso_storage) > 0
    error_message = "Storage ID must not be empty."
  }
}

variable "proxmox_iso_name" {
  type        = string
  description = "Name of the ISO file to upload (must end in .iso, .img, or .qcow2)"
  validation {
    condition     = can(regex("^.*\\.(iso|img|qcow2)$", var.proxmox_iso_name))
    error_message = "ISO name must end with .iso, .img, or .qcow2."
  }
}

variable "proxmox_iso_url" {
  type        = string
  description = "URL to download the ISO from"
  validation {
    condition     = can(regex("^https?://.*", var.proxmox_iso_url))
    error_message = "ISO URL must start with http:// or https://."
  }
}

variable "proxmox_iso_checksum" {
  type        = string
  description = "Expected checksum of the downloaded file"
  default     = null
}

variable "proxmox_iso_checksum_algorithm" {
  type        = string
  description = "Algorithm for the checksum (sha256, md5, sha1, sha512)"
  default     = "sha256"
  validation {
    condition     = contains(["sha256", "md5", "sha1", "sha512"], var.proxmox_iso_checksum_algorithm)
    error_message = "Algorithm must be one of: sha256, md5, sha1, sha512."
  }
}

variable "proxmox_upload_overwrite" {
  type        = bool
  description = "Overwrite existing file if it exists"
  default     = true
}
