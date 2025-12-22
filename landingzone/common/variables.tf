variable "tenancy_ocid"  {
    description = "The OCID of teh tenancy holding the API key"
    type        = string
}

variable "region"  {
    description = "The region where the LZ should be created"
    type        = string
    default = "eu-frankfurt-1"
}

variable "user_ocid"  { 
    description = "The OCID of the tuser holding the API key"
    type        = string
}

variable "fingerprint"  { 
    description = "The fingeprint of the private key of the API key"
    type        = string
}

variable "private_key_path"  { 
    description = "The location of private key for the API key"
    type        = string
    default = "/Users/ingeos/.oci/nose.pem"
}

variable "private_key_password" { 
    description = "The private key passphrase for the API key"
    type        = string
    default = ""
}

variable "domain_admin_email" { 
    description = "Email of Domain Adminstrator to receive welcome mail"
    type        = string
    default = ""
}

variable "domain_admin_last_name" { 
    description = "Email of Domain Adminstrator to receive welcome mail"
    type        = string
    default = ""
}

variable "domain_admin_first_name" { 
    description = "Email of Domain Adminstrator to receive welcome mail"
    type        = string
    default = ""
}

variable "domain_admin_user_name" { 
    description = "Email of Domain Adminstrator to receive welcome mail"
    type        = string
    default = ""
}

variable "lzroot_ocid" {
  description = "The OCID of the landingzone holding compartment"
  type        = string
}

#variable "iam_domain_ocid" {
#  description = "The OCID of the IAM Identity Domain"
#  type        = string
#}
variable "domain_license_type" {
  description = "The OCID of the IAM Identity Domain"
  type        = string
  default = "oracle-apps-premium"
}
