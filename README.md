<!-- BEGIN_TF_DOCS -->
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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 0.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.70.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_download_file.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_download_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_proxmox_iso_checksum"></a> [proxmox\_iso\_checksum](#input\_proxmox\_iso\_checksum) | Expected checksum of the downloaded file | `string` | `null` | no |
| <a name="input_proxmox_iso_checksum_algorithm"></a> [proxmox\_iso\_checksum\_algorithm](#input\_proxmox\_iso\_checksum\_algorithm) | Algorithm for the checksum (sha256, md5, sha1, sha512) | `string` | `"sha256"` | no |
| <a name="input_proxmox_iso_name"></a> [proxmox\_iso\_name](#input\_proxmox\_iso\_name) | Name of the ISO file to upload (must end in .iso, .img, or .qcow2) | `string` | n/a | yes |
| <a name="input_proxmox_iso_storage"></a> [proxmox\_iso\_storage](#input\_proxmox\_iso\_storage) | Proxmox Storage ID for ISOs (e.g., 'local', 'cephfs') | `string` | n/a | yes |
| <a name="input_proxmox_iso_url"></a> [proxmox\_iso\_url](#input\_proxmox\_iso\_url) | URL to download the ISO from | `string` | n/a | yes |
| <a name="input_proxmox_node"></a> [proxmox\_node](#input\_proxmox\_node) | Target Proxmox Node Name | `string` | n/a | yes |
| <a name="input_proxmox_upload_overwrite"></a> [proxmox\_upload\_overwrite](#input\_proxmox\_upload\_overwrite) | Overwrite existing file if it exists | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_datastore_id"></a> [datastore\_id](#output\_datastore\_id) | The datastore ID where the file was uploaded |
| <a name="output_file_name"></a> [file\_name](#output\_file\_name) | The name of the downloaded file |
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the downloaded file |
<!-- END_TF_DOCS -->