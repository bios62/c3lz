# --- Network Admin Policies ---
resource "oci_identity_policy" "netadmin_policies" {
    compartment_id = var.tenancy_ocid
    description    = "Allow netadmins to manage all network resources"
    name           = "NetAdminPolicy"
    statements     = [
        "Allow group 'MLZ_IAM_Domain'/'netadmin' to manage virtual-network-family in compartment network"
    ]
}

# --- Security Admin Policies ---
resource "oci_identity_policy" "security_policies" {
    compartment_id = var.tenancy_ocid
    description    = "Allow security to manage the audit bucket"
    name           = "SecurityAdminPolicy"
    statements     = [
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to manage objects in compartment security where target.bucket.name='audit'",
        "Allow group 'MLZ_IAM_Domain'/'securityadmin' to read buckets in compartment security"
    ]
}

# --- Production Group Policies ---
resource "oci_identity_policy" "production_policies" {
    compartment_id = var.tenancy_ocid
    description    = "Allow production to manage instances and use network"
    name           = "ProductionPolicy"
    statements     = [
        # Manage instances in their own compartment
        "Allow group 'MLZ_IAM_Domain'/'production' to manage instance-family in compartment compute-prod",
        # Use (but not change) network resources in the network compartment
        "Allow group 'MLZ_IAM_Domain'/'production' to use virtual-network-family in compartment network",
        # Required for launching instances (allows using images and volumes)
        "Allow group 'MLZ_IAM_Domain'/'production' to manage volume-family in compartment compute-prod"
    ]
}

# --- Developer Group Policies ---
resource "oci_identity_policy" "developer_policies" {
    compartment_id = var.tenancy_ocid
    description    = "Allow developers to use network resources"
    name           = "DeveloperPolicy"
    statements     = [
        "Allow group 'MLZ_IAM_Domain'/'developers' to use virtual-network-family in compartment network"
    ]
}

