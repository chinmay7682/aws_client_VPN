output "clientvpn-id" {
  value = aws_ec2_client_vpn_endpoint.clientvpn.id
}
output "dns-name" {
  value = aws_ec2_client_vpn_endpoint.clientvpn.dns_name
}