[![terraform-docs](https://github.com/itlinuxfr/terraform-proxmox-upload-iso/actions/workflows/documentation.yaml/badge.svg)](https://github.com/itlinuxfr/terraform-proxmox-upload-iso/actions/workflows/documentation.yaml)
[![terraform-lint](https://github.com/itlinuxfr/terraform-proxmox-upload-iso/actions/workflows/tflint.yaml/badge.svg)](https://github.com/itlinuxfr/terraform-proxmox-upload-iso/actions/workflows/tflint.yaml)
[![Provider: bpg/proxmox](https://img.shields.io/badge/provider-bpg%2Fproxmox-623CE4?logo=terraform)](https://registry.terraform.io/providers/bpg/proxmox/latest)

# Usage

```hcl
module "talos_iso" {
  source = "./modules/proxmox_upload_iso"

  proxmox_node        = "pve-01"
  proxmox_iso_storage = "local"
  proxmox_iso_name    = "talos-v1.11.3-nocloud-amd64.iso"
  proxmox_iso_url     = "https://github.com/siderolabs/talos/releases/download/v1.11.3/talos-nocloud-amd64.iso"
  
  # Optional
  proxmox_upload_overwrite = true
  # proxmox_iso_checksum = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
}
```
