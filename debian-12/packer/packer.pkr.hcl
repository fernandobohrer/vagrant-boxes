
packer {
  required_plugins {
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
    vagrant = {
      source  = "github.com/hashicorp/vagrant"
      version = "~> 1"
    }
    virtualbox = {
      source  = "github.com/hashicorp/virtualbox"
      version = "~> 1"
    }
  }
}

source "virtualbox-iso" "debian_12" {
  vm_name = var.vm_name

  disk_size  = var.disk_size
  vboxmanage = var.vboxmanage

  iso_url      = var.iso_url
  iso_checksum = var.iso_checksum

  boot_command     = var.boot_command
  http_directory   = var.http_directory
  shutdown_command = var.shutdown_command

  guest_os_type        = var.guest_os_type
  guest_additions_path = var.guest_additions_path

  ssh_timeout            = var.ssh_timeout
  ssh_username           = var.ssh_username
  ssh_password           = var.ssh_password
  ssh_handshake_attempts = var.ssh_handshake_attempts
}

build {
  sources = ["source.virtualbox-iso.debian_12"]
  provisioner "ansible" {
    user             = var.ssh_username
    playbook_file    = var.playbook_file
    ansible_env_vars = var.ansible_env_vars
  }
  post-processors {
    post-processor "vagrant" {
      output = var.vagrant_output
    }
    post-processor "vagrant-cloud" {
      box_tag = var.vagrant_box_tag
      version = var.vagrant_box_version
    }
  }
}
