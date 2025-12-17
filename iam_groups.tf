resource "oci_identity_domain_group" "netadmin" {
    domain_id    = oci_identity_domain.mini_lz_domain.id
    display_name = "netadmin"
    description  = "Network Administrators"
}

resource "oci_identity_domain_group" "securityadmin" {
    domain_id    = oci_identity_domain.mini_lz_domain.id
    display_name = "securityadmin"
    description  = "Security Administrators"
}

resource "oci_identity_domain_group" "production" {
    domain_id    = oci_identity_domain.mini_lz_domain.id
    display_name = "production"
    description  = "Production Operations"
}

resource "oci_identity_domain_group" "developers" {
    domain_id    = oci_identity_domain.mini_lz_domain.id
    display_name = "developers"
    description  = "Application Developers"
}

