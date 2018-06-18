# using aws provider
provider "aws" {
  region = "${var.region}"
}

# define ubuntu ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.image_type}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# create launch configuration per instance type
resource "aws_launch_configuration" "by_instance_type" {
  count         = "${length(var.instance_types_and_prices)}"
  name          = "launch_config_${element(keys(var.instance_types_and_prices), count.index)}"
  image_id      = "${data.aws_ami.ubuntu.id}"
  instance_type = "${element(keys(var.instance_types_and_prices), count.index)}"
  spot_price    = "${var.instance_types_and_prices[element(keys(var.instance_types_and_prices), count.index)]}"
}

# create autoscaling group for each subnet and launch configuration
resource "aws_autoscaling_group" "by_subnet_and_launch_configuration" {
  count                = "${length(var.subnet_ids)*length(var.instance_types_and_prices)}"
  name                 = "asg_${count.index}"
  launch_configuration = "${element(aws_launch_configuration.by_instance_type.*.name, count.index)}"
  min_size             = 1
  max_size             = 2
  vpc_zone_identifier  = "${list(var.subnet_ids[count.index/length(var.instance_types_and_prices)])}"

  lifecycle {
    create_before_destroy = true
  }
}
