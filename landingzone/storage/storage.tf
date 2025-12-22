#
# Lookup the namespace for teh tenanc object storage
# 
data "oci_objectstorage_namespace" "ns" {
    compartment_id = var.tenancy_ocid
}

resource "oci_objectstorage_bucket" "audit_bucket" {
    # Bucket for log files and security related files
    # Dynamic lookup based on the compartment name "security"
    compartment_id = local.lz_map["security"]
    
    name           = "audit"
    namespace      = data.oci_objectstorage_namespace.ns.namespace
    storage_tier   = "Standard"
    access_type    = "NoPublicAccess"
    versioning     = "Enabled"
}

resource "oci_objectstorage_bucket" "prod_bucket" {
    # Bucket for production object storage_tier
    # Dynamic lookup based on the compartment name "compute-prod"
    compartment_id = local.lz_map["compute-prod"]
    
    name           = "production"
    namespace      = data.oci_objectstorage_namespace.ns.namespace
    storage_tier   = "Standard"
    access_type    = "NoPublicAccess"
    versioning     = "Enabled"
}

resource "oci_objectstorage_bucket" "dev_bucket" {
    # Bucket for production object storage_tier
    # Dynamic lookup based on the compartment name "compute-dev"
    compartment_id = local.lz_map["compute-dev"]
    
    name           = "development"
    namespace      = data.oci_objectstorage_namespace.ns.namespace
    storage_tier   = "Standard"
    access_type    = "NoPublicAccess"
    versioning     = "Enabled"
}