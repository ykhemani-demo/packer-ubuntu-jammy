locals {
  encrypted = var.encrypt_boot && var.aws_kms_key_id != "" ? "encrypted-" : ""
  timestamp = formatdate("YYYYMMDD-hhmmss", timestamp())
}

data "amazon-ami" "ubuntu-us-east-1" {
  filters = {
    #name                = "${var.source_image_family}/images/${var.ami_virtualization_type}-ssd/${var.source_image_name}"
    name                = var.source_ami_filter_name
    root-device-type    = var.source_ami_filter_rooot_device_type
    virtualization-type = var.source_ami_filter_virtualization_type
  }

  most_recent = true
  owners      = var.source_ami_owners
  region      = "us-east-1"
}

data "amazon-ami" "ubuntu-us-east-2" {
  filters = {
    #name                = "${var.source_image_family}/images/${var.ami_virtualization_type}-ssd/${var.source_image_name}"
    name                = var.source_ami_filter_name
    root-device-type    = var.source_ami_filter_rooot_device_type
    virtualization-type = var.source_ami_filter_virtualization_type
  }

  most_recent = true
  owners      = var.source_ami_owners
  region      = "us-east-2"
}

data "amazon-ami" "ubuntu-us-west-1" {
  filters = {
    #name                = "${var.source_image_family}/images/${var.ami_virtualization_type}-ssd/${var.source_image_name}"
    name                = var.source_ami_filter_name
    root-device-type    = var.source_ami_filter_rooot_device_type
    virtualization-type = var.source_ami_filter_virtualization_type
  }

  most_recent = true
  owners      = var.source_ami_owners
  region      = "us-west-1"
}

data "amazon-ami" "ubuntu-us-west-2" {
  filters = {
    #name                = "${var.source_image_family}/images/${var.ami_virtualization_type}-ssd/${var.source_image_name}"
    name                = var.source_ami_filter_name
    root-device-type    = var.source_ami_filter_rooot_device_type
    virtualization-type = var.source_ami_filter_virtualization_type
  }

  most_recent = true
  owners      = var.source_ami_owners
  region      = "us-west-2"
}

source "amazon-ebs" "ubuntu-us-east-1" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-east-1"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""

  source_ami = data.amazon-ami.ubuntu-us-east-1.id
  communicator = var.amazon_communicator
  ssh_username = var.amazon_ssh_username

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}

source "amazon-ebs" "ubuntu-us-east-2" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-east-2"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""

  source_ami = data.amazon-ami.ubuntu-us-east-2.id
  communicator = var.amazon_communicator
  ssh_username = var.amazon_ssh_username

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}

source "amazon-ebs" "ubuntu-us-west-1" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-west-1"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""

  source_ami = data.amazon-ami.ubuntu-us-west-1.id
  communicator = var.amazon_communicator
  ssh_username = var.amazon_ssh_username

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}

source "amazon-ebs" "ubuntu-us-west-2" {
  ami_name      = "${var.prefix}-${local.encrypted}${local.timestamp}"
  region        = "us-west-2"
  instance_type = var.aws_instance_type
  encrypt_boot  = var.encrypt_boot
  kms_key_id    = var.encrypt_boot ? var.aws_kms_key_id : ""

  source_ami = data.amazon-ami.ubuntu-us-west-2.id
  communicator = var.amazon_communicator
  ssh_username = var.amazon_ssh_username

  launch_block_device_mappings {
    device_name = "/dev/sda1"
    volume_size = 20
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.amazon_image_name} - ${var.owner} ${local.timestamp}"
    }
  )
}
