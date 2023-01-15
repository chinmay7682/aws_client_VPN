variable "server_certificate_arn" {
  description = "arn of server certificate created before and kept in ACM"
}
variable "root_certificate_chain_arn" {
  description = "arn of client certificate created before and kept in ACM"
}
variable "vpn_subnet" {
  description = "vpn subnet id to associate with the Client VPN endpoint"
}
variable "vpn_authorization_cidr" {
  description = "CIDR of the network to which the client will have access to the specified network"
}

variable "client_cidr_block" {
  description = "CIDR of the client network,should be greater than /22"
}
