resource "oci_identity_domain" "mini_lz_domain" {
    compartment_id = var.tenancy_ocid
    description    = "Identity Domain for the Mini Landing Zone"
    display_name   = "MLZ_IAM_Domain"
    home_region    = var.region
    license_type   = "free"
}

