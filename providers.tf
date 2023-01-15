#Below is the provider configuration with Shared Configuration and Credentials Files.
provider "aws" {
  region                   = "ap-south-1"
  shared_config_files      = ["/Users/vanch/.aws/config"]
  shared_credentials_files = ["/Users/vanch/.aws/credentials"]
  profile                  = "AWSAmbassador"
}