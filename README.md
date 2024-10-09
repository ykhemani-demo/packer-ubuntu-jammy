# packer-ubuntu-jammy

## Background

This repo provides a [HashiCorp](https://hashicorp.com) [Packer](https://packer.io) template for building machine image(s) based on [Ubuntu 22.04 (Ubuntu Jammy Jellyfish)](https://releases.ubuntu.com/jammy/).

Packer allows you to deliver consistent images for multiple public and private cloud platforms from a common configuration.

The Packer template in this repo builds off of Ubuntu Jammy Jellyfish, and delivers images on [AWS](https://aws.amazon.com).

The images that are built are registered in the HashiCorp Cloud Platform ([HCP](https://cloud.hashicorp.com)) Packer Registry.

Use the Packer template for delivering a base golden image.

### Provisioners

This Packer template uses the [Shell provisioner](https://developer.hashicorp.com/packer/docs/provisioners/shell) and [Ansible provisioner](https://developer.hashicorp.com/packer/integrations/hashicorp/ansible/latest/components/provisioner/ansible). The Ansible provisioner calls the [playbook.yaml](playbook.yaml) Ansible playbook to configure and install software in the image.

## Usage

### Prerequisites

#### Software

This Packer template has been tested with the following software on a Mac running macOS on Apple Silicon.

* [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli) version 1.11.2
* [Ansible](https://www.ansible.com/) version 2.17.2.

For the Ansible provisioner, please add the following to your `.ansible.cfg` file:

```
[ssh_connection]
transfer_method = smart
```

#### Cloud Credentials

For provisioning to AWS, you will need AWS clould credentials. Set these as environment variables:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_SESSION_TOKEN` # if needed for your AWS account

For registering the image with the HCP Packer Registry, you will need HCP cloud credentials. Set these as environment variables as follows:

* `HCP_CLIENT_ID`
* `HCP_CLIENT_SECRET`

#### Packer Variables

Set the values for Packer variables. See [example.pkrvars.hcl](example.pkrvars.hcl) for an example.

### Running Packer

#### Initialize Packer

```
packer init -var-file=<variables file> .
```

#### Check and correct formatting of the Packer configuration

```
packer fmt -var-file=<variables file> .
```

#### Validate the Packer configuration

```
packer validate -var-file=<variables file> .
```

#### Build the machine image(s)

```
packer build -var-file=<variables file> .
```

---
