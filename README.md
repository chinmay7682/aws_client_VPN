# Terraform code repo for AWS client VPN

This terraform code installs a client vpn.

The following resources will be created:

1. A VPC 
2. Two private subnets - One for client VPN and one for Application subnet
3. A route table for private subnets
4. VPN Endpoint - Provides an AWS Client VPN endpoint for OpenVPN clients.
5. Provides network associations for AWS Client VPN endpoints.
6. A CloudWatch log group to store session logs.

## Pre-requisite

1. Generate server and client certificates. Store them in ACM
2. Create a Ec2 instance in Application subnet

___
## Terraform execution steps

* To initialize a working directory containing Terraform configuration files:

<pre><code>terraform init</pre></code>

* To validate the Terraform configuration

<pre><code>terraform validate</pre></code>

* To format your Terraform code 

<pre><code>terraform fmt --recursive</pre></code>

* To create an execution plan, which lets you preview the changes to your infrastructure:

<pre><code>terraform plan</pre></code>

* To execute the actions proposed in a Terraform plan:

<pre><code>terraform apply</pre></code>

* To destroy the infrastructure created before by using Terraform:

<pre><code>terraform destroy</pre></code>

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
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.app-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.vpn-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.app-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.vpn-subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpn-vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_CIDR"></a> [app\_CIDR](#input\_app\_CIDR) | vpn CIDR to host Application Instance which can access by the clients over VPN | `string` | `""` | yes |
| <a name="input_client_cidr_block"></a> [client\_cidr\_block](#input\_client\_cidr\_block) | CIDR of the client network,should be greater than /22 | `any` | `""` | yes |
| <a name="input_root_certificate_chain_arn"></a> [root\_certificate\_chain\_arn](#input\_root\_certificate\_chain\_arn) | arn of client certificate created before and kept in ACM | `string` | `""` | yes |
| <a name="input_server_certificate_arn"></a> [server\_certificate\_arn](#input\_server\_certificate\_arn) | arn of server certificate created before and kept in ACM | `string` | `""` | yes |
| <a name="input_session_timeout_hours"></a> [session\_timeout\_hours](#input\_session\_timeout\_hours) | The maximum session duration is a trigger by which end-users are required to re-authenticate prior to establishing a VPN session.Valid values: 8 \| 10 \| 12 \| 24 | `string` | `"24"` | no |
| <a name="input_split_tunnel"></a> [split\_tunnel](#input\_split\_tunnel) | Indicates wheather split-tunnel is enabled on VPN endpoint | `bool` | `false` | no |
| <a name="input_transport_protocol"></a> [transport\_protocol](#input\_transport\_protocol) | The transport protocol to be used by the VPN session | `string` | `"udp"` | no |
| <a name="input_vpn_CIDR"></a> [vpn\_CIDR](#input\_vpn\_CIDR) | vpn CIDR to associate with the Client VPN endpoint | `string` | `""` | yes |
| <a name="input_vpn_authorization_cidr"></a> [vpn\_authorization\_cidr](#input\_vpn\_authorization\_cidr) | CIDR of the network to which the client will have access to the specified network | `any` | `""` | yes |
| <a name="input_vpn_port"></a> [vpn\_port](#input\_vpn\_port) | The port number for the Client VPN endpoint. Valid values are 443 and 1194 | `string` | `"443"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clientvpn-id"></a> [clientvpn-id](#output\_clientvpn-id) | n/a |
| <a name="output_dns-name"></a> [dns-name](#output\_dns-name) | n/a |

For more information on Amazon Client VPN, visit [Amazon Client VPN](https://docs.aws.amazon.com/vpn/latest/clientvpn-admin/what-is.html).

For more information on Terraform AWS Client VPN, visit [Terraform Resource: Client VPN](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_client_vpn_endpoint).
