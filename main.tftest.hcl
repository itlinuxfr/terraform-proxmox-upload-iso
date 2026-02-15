provider "proxmox" {
  endpoint  = "https://localhost:8006/"
  api_token = "user@pam!token=secret"
  insecure  = true
  ssh {
    agent = false
  }
}

# Validate valid plan
run "valid_plan" {
  command = plan

  variables {
    proxmox_node        = "pve-test"
    proxmox_iso_storage = "local"
    proxmox_iso_name    = "test.iso"
    proxmox_iso_url     = "https://example.com/image.iso"
  }
}

# Validate invalid ISO extension
run "invalid_extension" {
  command = plan

  variables {
    proxmox_node        = "pve-test"
    proxmox_iso_storage = "local"
    proxmox_iso_name    = "test.txt"
    proxmox_iso_url     = "https://example.com/image.txt"
  }

  expect_failures = [
    var.proxmox_iso_name
  ]
}

# Validate invalid URL
run "invalid_url" {
  command = plan

  variables {
    proxmox_node        = "pve-test"
    proxmox_iso_storage = "local"
    proxmox_iso_name    = "test.iso"
    proxmox_iso_url     = "ftp://example.com/image.iso"
  }

  expect_failures = [
    var.proxmox_iso_url
  ]
}

# Validate invalid Checksum Algorithm
run "invalid_algo" {
  command = plan

  variables {
    proxmox_node                   = "pve-test"
    proxmox_iso_storage            = "local"
    proxmox_iso_name               = "test.iso"
    proxmox_iso_url                = "https://example.com/image.iso"
    proxmox_iso_checksum_algorithm = "crc32"
    proxmox_iso_checksum           = "dummy"
  }

  expect_failures = [
    var.proxmox_iso_checksum_algorithm
  ]
}
