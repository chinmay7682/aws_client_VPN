# Terraform code repo for AWS client VPN

This terraform code installs a client vpn.

The following resources will be created:

1. VPN Endpoint - Provides an AWS Client VPN endpoint for OpenVPN clients.
2. Provides network associations for AWS Client VPN endpoints.
3. A CloudWatch log group to store session logs.

## Pre-requisite

1. Generate server and client certificates. Store them in ACM
2. Create a VPC with 2 subnets. 1 for client VPN subnet and another for Application instance subnet
3. Create a Ec2 instance in Application subnet

## Terraform execution steps

1. terraform init
2. terraform validate
3. terraform fmt --recursive
4. terraform plan
5. terraform apply

## Download the Client VPN endpoint configuration file

Now the infrastructure is ready. Now download the client configuration.

<img width="508" alt="image" src="https://user-images.githubusercontent.com/65828245/212559795-b03e0522-af30-456c-abf1-974a0c5e1fb4.png">


Keep the client certificate ready that we created earlier.

Open the configuration file with any editor and add the following lines

cert /path/to/client1.crt

key /path/to/client1.key

or

<cert>
  
— — -BEGIN CERTIFICATE — — -
  
***Paste Your Cert Text Here***

— — -END CERTIFICATE — — -
  
</cert>

<key>
  
— — -BEGIN PRIVATE KEY — — -
  
***Paste Your Cert Private Key Here***

— — -END PRIVATE KEY — — -
  
</key>

Also, modify the endpoint DNS name by adding a random prefix

Original: cvpn-endpoint-0c2c9d41ee76a29fa.prod.clientvpn.ap-south-1.amazonaws.com

Modified: xxxxxx.cvpn-endpoint-0c2c9d41ee76a29fa.prod.clientvpn.ap-south-1.amazonaws.com

Download OpenVPN Client from https://openvpn.net/community-downloads/

Import the edited VPN configuration file in the OpenVPN client. Click on browse and import the configuration file. The VPN will automatically connect

<img width="226" alt="image" src="https://user-images.githubusercontent.com/65828245/212559913-88fd1eac-c600-4771-aeeb-92b5c032bf06.png">

<img width="218" alt="image" src="https://user-images.githubusercontent.com/65828245/212559939-d0908be1-84e6-4730-bb53-4cb7b8403304.png">


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
| <a name="input_client_cidr_block"></a> [client\_cidr\_block](#input\_client\_cidr\_block) | CIDR of the client network,should be greater than /22 | `any` | `""` | yes |
| <a name="input_root_certificate_chain_arn"></a> [root\_certificate\_chain\_arn](#input\_root\_certificate\_chain\_arn) | arn of client certificate created before and kept in ACM | `string` | `""` | yes |
| <a name="input_server_certificate_arn"></a> [server\_certificate\_arn](#input\_server\_certificate\_arn) | arn of server certificate created before and kept in ACM | `string` | `""` | yes |
| <a name="input_vpn_authorization_cidr"></a> [vpn\_authorization\_cidr](#input\_vpn\_authorization\_cidr) | CIDR of the network to which the client will have access to the specified network | `any` | `""` | yes |
| <a name="input_vpn_subnet"></a> [vpn\_subnet](#input\_vpn\_subnet) | vpn subnet id to associate with the Client VPN endpoint | `string` | `""` | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clientvpn-id"></a> [clientvpn-id](#output\_clientvpn-id) | n/a |
| <a name="output_dns-name"></a> [dns-name](#output\_dns-name) | n/a |

Follow [this](https://medium.com/@vanchi811/aws-client-vpn-to-securely-access-aws-resources-in-multiple-vpcs-using-transit-gateway-ce363096cde3) for complete AWS client VPN setup via console
