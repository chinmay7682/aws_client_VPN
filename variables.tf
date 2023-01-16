variable "server_certificate_arn" {
  description = "arn of server certificate created before and kept in ACM"
  type        = string
  default     = ""
}
variable "root_certificate_chain_arn" {
  description = "arn of client certificate created before and kept in ACM"
  type        = string
  default     = ""
}
# if you need only AWS destination traffic to flow over VPN, then set the value to true.
variable "split_tunnel" {
  description = "Indicates wheather split-tunnel is enabled on VPN endpoint"
  type        = bool
  default     = false
}
variable "vpn_port" {
  description = "The port number for the Client VPN endpoint. Valid values are 443 and 1194"
  type        = string
  default     = "443"
}
variable "transport_protocol" {
  description = "The transport protocol to be used by the VPN session"
  type        = string
  default     = "udp"
}
variable "session_timeout_hours" {
  description = "The maximum session duration is a trigger by which end-users are required to re-authenticate prior to establishing a VPN session.Valid values: 8 | 10 | 12 | 24"
  type        = string
  default     = "24"
}
variable "vpn_CIDR" {
  description = "vpn CIDR to associate with the Client VPN endpoint"
  type        = string
  default     = ""
}

variable "app_CIDR" {
  description = "vpn CIDR to host Application Instance which can access by the clients over VPN"
  type        = string
  default     = ""
}
variable "vpn_authorization_cidr" {
  description = "CIDR of the network to which the client will have access to the specified network"
  type        = any
  default     = ""
}

variable "client_cidr_block" {
  description = "CIDR of the client network,should be greater than /22"
  type        = any
  default     = ""
}
