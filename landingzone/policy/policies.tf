# --- Network Admin Policies ---
resource "oci_identity_policy" "netadmin_policies" {
    compartment_id = var.lzroot_ocid
    description    = "Allow netadmins to manage all network resources"
    name           = "NetAdminPolicy"
    statements     = [
        "Allow group 'MLZ_IAM_Domain'/'netadmin' to manage virtual-network-family in compartment network"
    ]
}

# --- Security Admin Policies ---
resource "oci_identity_policy" "security_policies" {
    compartment_id = var.lzroot_ocid
    description    = "Allow security to security artifacts"
    name           = "SecurityAdminPolicy"
    statements     = [
        # Allow audit type objects 
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to manage object-family in compartment security where target.bucket.name='audit'",
        # Redundant, but included for visibility
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to manage buckets in compartment security",
        # Allow to create block volumes for grafhana instances
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage volume-family in compartment security",
        # Allow to create instances for monitoring
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to use virtual-network-family in compartment security",
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to manage volume-family in compartment security"
    ]
}
# --- Security audit Policies ---
resource "oci_identity_policy" "audit_policies" {
    compartment_id = var.tenancy_ocid
    description    = "Allow security to audit all resources"
    name           = "SecurityAuditPolicy"
    statements     = [
        # Audit all resoruces
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to read all-resources in tenancy"
    ]
}

# --- Production Group Policies ---
resource "oci_identity_policy" "production_policies" {
    compartment_id = var.lzroot_ocid
    description    = "Allow production to manage instances and use network"
    name           = "ProductionPolicy"
    statements     = [
        # Manage instances in their own compartment
        "Allow group 'MLZ_IAM_Domain'/'production' to manage instance-family in compartment compute-prod",
        # Use (but not change) network resources in the network compartment
        "Allow group 'MLZ_IAM_Domain'/'production' to use virtual-network-family in compartment network",
        # Required for launching instances (allows using images and volumes)
        "Allow group 'MLZ_IAM_Domain'/'production' to manage volume-family in compartment compute-prod",
        # Required policy for managing OKE
        "Allow group 'MLZ_IAM_Domain'/'production' to manage cluster-family in compartment compute-prod",
        "Allow group 'MLZ_IAM_Domain'/'production' to manage volume-family in compartment compute-prod",
        # Required policy to create object storage objects
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage object-family in compartment compute-prod"
    ]
}

# --- Developer Group Policies ---
resource "oci_identity_policy" "developer_policies" {
    compartment_id = var.lzroot_ocid
    description    = "Allow developers to use network resources"
    name           = "DeveloperPolicy"
    statements     = [
        # Manage instances in their own compartment
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage instance-family in compartment compute-dev",
        # Use (but not change) network resources in the network compartment
        "Allow group 'MLZ_IAM_Domain'/'developers' to use virtual-network-family in compartment network",
        # Required for launching instances (allows using images and volumes)
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage volume-family in compartment compute-dev",
        # Required policy for managing OKE
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage cluster-family in compartment compute-dev",
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage volume-family in compartment compute-dev",
        # Required policy to create object storage objects
        "Allow group 'MLZ_IAM_Domain'/'developers' to manage object-family in compartment compute-dev"

    ]
}

