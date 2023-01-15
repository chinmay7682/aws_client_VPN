

[36mrequirement.terraform[0m (= 1.0.2)


[36mprovider.aws[0m (4.50.0)




[36mresource.aws_cloudwatch_log_group.clientvpn (resource)[0m (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group)
[36mresource.aws_cloudwatch_log_stream.clientvpn (resource)[0m (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream)
[36mresource.aws_ec2_client_vpn_authorization_rule.clientvpn-rule (resource)[0m (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_authorization_rule)
[36mresource.aws_ec2_client_vpn_endpoint.clientvpn (resource)[0m (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_endpoint)
[36mresource.aws_ec2_client_vpn_network_association.clientvpn-association (resource)[0m (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_network_association)
[36mresource.aws_ec2_client_vpn_route.clientvpn-route (resource)[0m (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_route)


[36minput.client_cidr_block[0m (required)
[90mCIDR of the client network,should be greater than /22[0m

[36minput.root_certificate_chain_arn[0m (required)
[90marn of client certificate created before and kept in ACM[0m

[36minput.server_certificate_arn[0m (required)
[90marn of server certificate created before and kept in ACM[0m

[36minput.vpn_authorization_cidr[0m (required)
[90mCIDR of the network to which the client will have access to the specified network[0m

[36minput.vpn_subnet[0m (required)
[90mvpn subnet id to associate with the Client VPN endpoint[0m


[36moutput.clientvpn-id[0m
[90mn/a[0m

[36moutput.dns-name[0m
[90mn/a[0m
