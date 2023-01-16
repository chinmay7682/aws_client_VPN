resource "aws_ec2_client_vpn_endpoint" "clientvpn" {
  description            = "terraform-clientvpn"
  server_certificate_arn = var.server_certificate_arn
  client_cidr_block      = var.client_cidr_block
  split_tunnel           = var.split_tunnel
  vpn_port               = var.vpn_port
  transport_protocol     = var.transport_protocol
  session_timeout_hours  = var.session_timeout_hours

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = var.root_certificate_chain_arn
  }

  connection_log_options {
    enabled               = true
    cloudwatch_log_group  = aws_cloudwatch_log_group.clientvpn.name
    cloudwatch_log_stream = aws_cloudwatch_log_stream.clientvpn.name
  }

  depends_on = [
    aws_cloudwatch_log_group.clientvpn,
    aws_cloudwatch_log_stream.clientvpn
  ]
}

resource "aws_ec2_client_vpn_authorization_rule" "clientvpn-rule" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.clientvpn.id
  target_network_cidr    = var.vpn_authorization_cidr
  authorize_all_groups   = true

  depends_on = [
    aws_ec2_client_vpn_endpoint.clientvpn
  ]
}

resource "aws_ec2_client_vpn_network_association" "clientvpn-association" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.clientvpn.id
  subnet_id              = aws_subnet.vpn-subnet.id

  depends_on = [
    aws_ec2_client_vpn_endpoint.clientvpn,
    aws_subnet.vpn-subnet
  ]
}

resource "aws_ec2_client_vpn_route" "clientvpn-route" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.clientvpn.id
  destination_cidr_block = "0.0.0.0/0"
  target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.clientvpn-association.subnet_id

  depends_on = [
    aws_ec2_client_vpn_endpoint.clientvpn
  ]
}

resource "aws_cloudwatch_log_group" "clientvpn" {
  name = "clientvpn-log-group"

  tags = {
    Environment = "developement"
    Application = "clientvpn"
  }
}
resource "aws_cloudwatch_log_stream" "clientvpn" {
  name           = "clientvpn-log-stream"
  log_group_name = aws_cloudwatch_log_group.clientvpn.name
}