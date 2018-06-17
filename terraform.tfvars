/*
Variables values
*/

region = "eu-west-2"

subnet_ids = ["subnet-d8de5db1", "subnet-20a4665a", "subnet-e75b4baa"]

instance_types_and_prices = {
  "t2.micro"  = 0.0035
  "t2.small"  = 0.0069
  "t2.medium" = 0.0139
  "t2.large"  = 0.0278
}

image_type = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"