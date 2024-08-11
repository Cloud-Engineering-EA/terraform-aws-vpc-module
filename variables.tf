# VPC

variable "create_vpc" {
    description = "Control variable for VPC creation"
    type = bool
    default = true
}

variable "name" {
    description = "Name for all the resources as an identifier"
    type = string
    default = ""
}

variable "cidr" {
    description = "Optional IPv4 CIDR block for the VPC. CIDR can be set or derived from IPAM"
    type = string
    default = "10.0.0.0/16"
}

variable "secondary_cidr_blocks" {
    description = "List of secondary CIDR blocks for VPC"
    type = list(string)
    default = []
}

variable "instance_tenancy" {
    description = "A tenancy option for instances launched into the VPC"
    type = string
    default = "default"
}

variable "enable_dns_support" {
    description = "Set to true to enable DNS support in the VPC"
    type = bool
    default = true
  
}

variable "enable_dns_hostnames" {
    description = "Set to true to enable DNS hostnames in the VPC"
    type = bool
    default = true  
}

variable "azs" {
    description = "A list of availability zones names or ids (preferred) in the region"
    type = list(string)
    default = [ ]
  
}

variable "enable_network_address_usage_metrics" {
    description = "Determines whether network address usage metrics are enabled for the VPC"
    type = bool
    default = null  
}

variable "use_ipam_pool" {
    description = "Flag to control IPAM pool usage for CIDR allocation"
    type = bool
    default = false  
}

variable "ipv4_ipam_pool_id" {
    description = "(Optional) IPAM pool ID for this VPC's IPv4 CIDR allocation"
    type = string
    default = null
}

variable "ipv4_netmask_length" {
    description = "(Optional)The netmask length of the IPv4 CIDR you want to allocate for this VPC"
    type = number
    default = null
}

variable "enable_ipv6" {
    description = "Requests an Amazon provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP address , or the CIDR block size"
    type = bool
    default = false
}

variable "ipv6_cidr" {
  description = "(Optional) IPv6 CIDR block to request from an IPAM Pool. Explicitly set or derive using ipv6_netmask_length"
}

variable "ipv6_ipam_pool_id" {
  description = "(Optional) IPAM Pool ID for the IPv6 CIDR"
  type = string
  default = "null"
}

variable "ipv6_netmask_length" {
  description = "(Optional) Netmask length of the IPv6 CIDR to request from IPAM. Conflicts with the value 'ipv6_cidr_block`. This can be omitted if IPAM pool has a `allocation_default_netmask_length` set. Valid values: `56`"
  type = number
  default = null
}

variable "ipv6_cidr_block_network_border_group" {
    description = "By default when an IPv6 CIDR is assigned to a VPC , a default ipv6_cidr_block_network_border_group will be set to the region of VPC.This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones"
    type = string
    default = "null"
}

variable "vpc_tags" {
    description = "Additional tags for the VPC"
    type = map(string)
    default = {} 
}

variable "tags" {
    description = "A map of tags to add to all resources"
    type = map(string)
    default = {} 
}

## DHCP Options Set

variable "enable_dhcp_options" {
    description = "Set this to true if there is a need to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers"
    type = bool
    default = false  
}

variable "dhcp_options_domain_name" {
    description = "Specifies the domain name to be used in the DHCP options set. Domain name must be unique"
    type = string
    default = ""
}

variable "dhcp_options_domain_name_servers" {
    description = "Specify a list of name servers to use with the DHCP options set, default to AWS provided"
    type = list(string)
    default = ["AmazonProvidedDNS"]
}

variable "dhcp_options_ntp_servers" {
    description = "Specify a list of NTP servers to use with the DHCP options set, DHCP options set must be set to true"
    type = list(string)
    default = []
}

variable "dhcp_options_netbios_name_servers" {
    description = "Specify a list of Netbios servers to use with the DHCP options set, DHCP options set must be set to true"
    type = list(string)
    default = []
}

variable "dhcp_options_netbios_node_type" {
    description = "Specify the Netbios node_type to use with the DHCP options set, DHCP options set must be set to true"
    type = string
    default = ""
}

variable "dhcp_options_tags" {
    description = "Additional tags for the DHCP option set, DHCP options set must be set to true"
    type = map(string)
    default = {}  
}

# Public Subnets 

variable "public_subnets" {
    description = "A list of public subnets inside the VPC"
    type = list(string)
    default = []  
}

variable "public_subnet_assign_ipv6_address_on_creation" {
    description = "Specify true to assign IPv6 address on interfaces created on public subnet, Default is false"
    type = bool
    default = false
}

variable "public_subnet_enable_dns64" {
    description = "Indicates whether DNS queries made to the Amazon-provided DNS resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: `true`"
    type = bool
    default = true
}

variable "public_subnet_enable_resource_name_dns_aaaa_record_on_launch" {
    description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: `true`"
    type = bool
    default = true
}

variable "public_sunet_enable_resource_name_dns_a_record_on_launch" {
    description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: `false`"
    type = bool
    default = false
}

variable "create_multiple_public_route_tables" {
    description = "Indicates whether to create a seperate route table for each public subnet. Default: `false`"
    type = bool
    default = false  
}

variable "public_subnet_ipv6_prefixes" {
    description = "Assigns IPv6 subnet id based upon the Amazon provided /56 prefix base 10 integer. Must be equal length to the corresponding IPv4 subnet list"
    type = list(string)
    default = []
}

variable "public_subnet_ipv6_native" {
    description = "Indicates whether to create an IPv6-only subnet. Default: `false`"
    type = bool
    default = false  
}

variable "map_public_ip_on_launch" {
    description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address.Default is `false`"
    type = bool
    default = false
}

variable "public_subnet_private_dns_hostname_type_on_launch" {
    description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valied values: `ip-name`, `resource-name`"
    type = string
    default = "null"  
}

variable "public_subnet_names" {
    description = "Explicit values to use in the Name tag on public subnets.If empty, Name tags are generated"
    type = list(string)
    default = []
}

variable "public_subnet_suffix" {
    description = "Suffix to append to public subnets names"
    type = string
    default = "public"  
}

variable "public_subnet_tags" {
    description = "Additional tags for the public subnets"
    type = map(string)
    default = {}  
}

variable "public_subnet_tags_per_az" {
    description = "Additional tags for the public subnets where the primary key is the AZ"
    type = map(map(string))
    default = {}  
}

variable "public_route_table_tags" {
    description = "Additional tags for the public route tables"
    type = map(string)
    default = {}  
}

# Public Network ACLs







