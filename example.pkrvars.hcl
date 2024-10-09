owner              = "yash"
bucket_name        = "ubuntu-jammy-golden-image"
bucket_description = "Organizational foundational golden image, based on Ubuntu 22.04 (Jammy)"
tags = {
  owner          = "yash"
  ttl            = "-1"
  config-as-code = "packer"
  repo           = "ykhemani-demo/packer-ubuntu-jammy"
}
