resource "oci_identity_domains_group" "netadmin" {
    display_name  = "netadmin"
    #description   = "Network Administrators"
    idcs_endpoint=local.idcs_endpoint
    schemas = ["urn:ietf:params:scim:schemas:core:2.0:Group"]
}

resource "oci_identity_domains_group" "securityadmin" {
    display_name  = "securityadmin"
    #description   = "Security Administrators"
    idcs_endpoint=local.idcs_endpoint
    schemas = ["urn:ietf:params:scim:schemas:core:2.0:Group"]
}

resource "oci_identity_domains_group" "production" {
    display_name  = "production"
    #escription   = "Production Operations"
    idcs_endpoint=local.idcs_endpoint
    schemas = ["urn:ietf:params:scim:schemas:core:2.0:Group"]
}

resource "oci_identity_domains_group" "developers" {
    display_name  = "developers"
    #description   = "Application Developers"
    idcs_endpoint=local.idcs_endpoint
    schemas = ["urn:ietf:params:scim:schemas:core:2.0:Group"]
}

