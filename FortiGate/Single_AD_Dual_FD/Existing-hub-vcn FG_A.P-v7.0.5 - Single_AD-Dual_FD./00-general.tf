##############################################################################################################
#
# FortiGate Terraform deployment
# Active Passive High Availability Single AD in OCI
#
##############################################################################################################

# Prefix for all resources created for this deployment in OCI
variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "HA-SAD"
}


##############################################################################################################
# Terraform state
##############################################################################################################

terraform {
  required_version = ">= 0.12"
}

##############################################################################################################
# Deployment in OCI
##############################################################################################################
# Access and secret keys to your environment
variable "tenancy_ocid" {
  default = ""
}
variable "compartment_ocid" {
  default = ""
}
variable "user_ocid" {
  default = ""
}
variable "fingerprint" {
  default = ""
}
variable "private_key_path" {
  default = ""
}
variable "region" {
  default = "me-jeddah-1"
}

variable "vcn_id" {
default = "existingvcnid"
}

###################################
# PROVIDER OCI
###################################
provider "oci" {
  tenancy_ocid = var.tenancy_ocid
  user_ocid = var.user_ocid
  fingerprint = var.fingerprint
  private_key_path = var.private_key_path
  region = var.region
}

##############################################################################################################
# SUBNETS in OCI
##############################################################################################################

##VCN and SUBNET ADDRESSES
### mgmt
variable "vcn_cidr" {
  default = "10.252.0.0/16"
}

variable "mgmt_subnet_cidr" {
  default = "10.252.0.0/28"
}

variable "mgmt_subnet_gateway" {
  default = "10.252.0.1"
}

### untrust - wan
variable "untrust_subnet_cidr" {
  default = "10.252.1.0/24"
}

variable "untrust_subnet_gateway" {
  default = "10.252.1.1"
}

variable "untrust_public_ip_lifetime" {
  default = "RESERVED"
  //or EPHEMERAL
}

### trust - lan
variable "trust_subnet_cidr" {
  default = "10.252.0.32/28"
}

variable "trust_subnet_gateway" {
  default = "10.252.0.33"
}

variable "hb_subnet_cidr" {
  default = "10.252.0.16/28"
}

##############################################################################################################
# FIREWALL IPs
##############################################################################################################
### FLOATING/FAILOVER
variable "untrust_floating_private_ip" {
  default = "10.252.1.10"
}

variable "trust_floating_private_ip" {
  default = "10.252.0.40"
}


#ACTIVE NODE
variable "mgmt_private_ip_primary_a" {
  default = "10.252.0.2"
}

variable "untrust_private_ip_primary_a" {
  default = "10.252.1.2"
}

variable "trust_private_ip_primary_a" {
  default = "10.252.0.34"
}

variable "hb_private_ip_primary_a" {
  default = "10.252.0.18"
}

#PASSIVE NODE
variable "mgmt_private_ip_primary_b" {
  default = "10.252.0.3"
}

variable "untrust_private_ip_primary_b" {
  default = "10.252.1.20"
}

variable "trust_private_ip_primary_b" {
  default = "10.252.0.35"
}

variable "hb_private_ip_primary_b" {
  default = "10.252.0.20"
}

##############################################################################################################
# IMAGES
##############################################################################################################

// variable "vm_image_ocid" {
//   default = "PIC or custom image OCID"
// }

variable "vm_image_ocid" {
  type = map

  default = {
     me-jeddah-1 = "ocid1.image.oc1..aaaaaaaapxqi6j4dq2tl3yz4h7tqz7oqaqzcvr5renzczzeiptvk3slhcmba"   
    //me-jeddah-1 = "ocid1.image.oc1..aaaaaaaayocemm3gyko7pav3fb3qh75ns7iadn5fje2mq7yvlhc4qd2erukq"
  }
}

variable "instance_shape" {
  default = "VM.Standard2.4"
}

# Choose an Availability Domain (1,2,3)
variable "availability_domain" {
  default = "1"
}

variable "volume_size" {
  default = "50" //GB
}

variable "license_vm-a" {
  default = "./fgt1.lic"
}

variable "license_vm-b" {
  default = "./fgt2.lic"
}

variable "sdn_oci_certificate_name" {
  default = "Fortinet_Factory"
}
