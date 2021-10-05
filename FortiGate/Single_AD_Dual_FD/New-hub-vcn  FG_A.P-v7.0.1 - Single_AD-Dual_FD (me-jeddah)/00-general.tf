##############################################################################################################
#
# FortiGate Terraform deployment
# Active Passive High Availability Single AD in OCI
#
##############################################################################################################

# Prefix for all resources created for this deployment in OCI
variable "tag_name_prefix" {
  description = "Provide a common tag prefix value that will be used in the name tag for all resources"
  default     = "FG-HA"
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
  default = "10.1.0.0/16"
}

variable "mgmt_subnet_cidr" {
  default = "10.1.1.0/24"
}

variable "mgmt_subnet_gateway" {
  default = "10.1.1.1"
}

### untrust - wan
variable "untrust_subnet_cidr" {
  default = "10.1.10.0/24"
}

variable "untrust_subnet_gateway" {
  default = "10.1.10.1"
}

variable "untrust_public_ip_lifetime" {
  default = "RESERVED"
  //or EPHEMERAL
}

### trust - lan
variable "trust_subnet_cidr" {
  default = "10.1.100.0/24"
}

variable "trust_subnet_gateway" {
  default = "10.1.100.1"
}

variable "hb_subnet_cidr" {
  default = "10.1.200.0/24"
}

##############################################################################################################
# FIREWALL IPs
##############################################################################################################
### FLOATING/FAILOVER
variable "untrust_floating_private_ip" {
  default = "10.1.10.10"
}

variable "trust_floating_private_ip" {
  default = "10.1.100.10"
}


#ACTIVE NODE
variable "mgmt_private_ip_primary_a" {
  default = "10.1.1.2"
}

variable "untrust_private_ip_primary_a" {
  default = "10.1.10.2"
}

variable "trust_private_ip_primary_a" {
  default = "10.1.100.2"
}

variable "hb_private_ip_primary_a" {
  default = "10.1.200.2"
}

#PASSIVE NODE
variable "mgmt_private_ip_primary_b" {
  default = "10.1.1.20"
}

variable "untrust_private_ip_primary_b" {
  default = "10.1.10.20"
}

variable "trust_private_ip_primary_b" {
  default = "10.1.100.20"
}

variable "hb_private_ip_primary_b" {
  default = "10.1.200.20"
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
     me-jeddah-1 = "ocid1.image.oc1..aaaaaaaabu6hszx2yexxqddvekarvsmpdltvp6sqqmrmlgqilpxuxjtqvyla"
   //me-jeddah-1 = "ocid1.image.oc1..aaaaaaaah4zz3nx2k2fyzzo7hzgq7knhn7i2wpatqymnpt3pgdcqzieeg2ca"
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
