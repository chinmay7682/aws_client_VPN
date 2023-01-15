Terraform code repo for AWS client VPN

1. Terraform execution steps
2. terraform init
3. terraform validate
4. terraform fmt --recursive
5. terraform plan
6. terraform apply
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.clientvpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_stream.clientvpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_ec2_client_vpn_authorization_rule.clientvpn-rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_authorization_rule) | resource |
| [aws_ec2_client_vpn_endpoint.clientvpn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_endpoint) | resource |
| [aws_ec2_client_vpn_network_association.clientvpn-association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_network_association) | resource |
| [aws_ec2_client_vpn_route.clientvpn-route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_cidr_block"></a> [client\_cidr\_block](#input\_client\_cidr\_block) | CIDR of the client network,should be greater than /22 | `any` | n/a | yes |
| <a name="input_root_certificate_chain_arn"></a> [root\_certificate\_chain\_arn](#input\_root\_certificate\_chain\_arn) | arn of client certificate created before and kept in ACM | `any` | n/a | yes |
| <a name="input_server_certificate_arn"></a> [server\_certificate\_arn](#input\_server\_certificate\_arn) | arn of server certificate created before and kept in ACM | `any` | n/a | yes |
| <a name="input_vpn_authorization_cidr"></a> [vpn\_authorization\_cidr](#input\_vpn\_authorization\_cidr) | CIDR of the network to which the client will have access to the specified network | `any` | n/a | yes |
| <a name="input_vpn_subnet"></a> [vpn\_subnet](#input\_vpn\_subnet) | vpn subnet id to associate with the Client VPN endpoint | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clientvpn-id"></a> [clientvpn-id](#output\_clientvpn-id) | n/a |
| <a name="output_dns-name"></a> [dns-name](#output\_dns-name) | n/a |
