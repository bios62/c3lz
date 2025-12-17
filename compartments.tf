resource "oci_identity_compartment" "security" {
    compartment_id = var.tenancy_ocid
    description    = "Compartment for security resources"
    name           = "security"
}

resource "oci_identity_compartment" "network" {
    compartment_id = var.tenancy_ocid
    description    = "Compartment for networking resources"
    name           = "network"
}

resource "oci_identity_compartment" "compute_prod" {
    compartment_id = var.tenancy_ocid
    description    = "Compartment for production compute instances"
    name           = "compute-prod"
}

resource "oci_identity_compartment" "compute_dev" {
    compartment_id = var.tenancy_ocid
    description    = "Compartment for development compute instances"
    name           = "compute-dev"
}

