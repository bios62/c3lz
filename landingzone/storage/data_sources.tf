

data "oci_identity_compartments" "lz_direct_children" {
    # Point directly to your Landing Zone parent
    compartment_id            = var.lzroot_ocid
    
    # Do NOT search the whole tree; only look at immediate children
    compartment_id_in_subtree = false
    state                     = "ACTIVE"
}

locals {
    # This map is now safe from collisions in other parts of the tenancy
    lz_map = { 
        for c in data.oci_identity_compartments.lz_direct_children.compartments : c.name => c.id 
    }
    
    security_comp_id = local.lz_map["security"]
    prod_comp_id  = local.lz_map["compute-prod"]
    dev_comp_id = local.lz_map["compute-dev"]
}