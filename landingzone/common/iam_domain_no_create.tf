#
# To be used if domain is not created as part of the script
#

data "oci_identity_domain" "mini_lz" {
  domain_id = var.iam_domain_ocid
}

# Define the local variable for the IDCS Endpoint
locals {
  idcs_endpoint = data.oci_identity_domain.mini_lz.home_region_url
}

output "domain_url" {
  value = local.idcs_endpoint
}
