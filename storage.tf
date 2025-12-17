resource "oci_objectstorage_bucket" "audit_bucket" {
    compartment_id = oci_identity_compartment.security.id
    name           = "audit"
    namespace      = data.oci_objectstorage_namespace.ns.namespace
    access_type    = "NoPublicAccess"
    storage_tier   = "Standard"
}

# Helper to get the tenancy namespace
data "oci_objectstorage_namespace" "ns" {
    compartment_id = var.tenancy_ocid
}

