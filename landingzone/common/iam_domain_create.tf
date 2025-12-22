#
# To be used if domain is not created as part of the script
#

resource "oci_identity_domain" "mini_lz" {
  compartment_id = var.tenancy_ocid
  display_name   = "MLZ_IAM_Domain"
  description    = "Domain for Mini landing zone for TSC C3 Test"
  license_type   = var.domain_license_type
  admin_last_name = var.domain_admin_last_name
  admin_first_name = var.domain_admin_first_name
  admin_user_name = var.domain_admin_user_name
  admin_email = var.domain_admin_email
  home_region= var.region
  is_notification_bypassed = true
}

# Define the local variable for the IDCS Endpoint
locals {
  idcs_endpoint = oci_identity_domain.mini_lz.home_region_url
}

output "domain_url" {
  value = local.idcs_endpoint
}
