
variable "vm_name" {
  type        = string
  description = "The name of the virtual machine being created."
}

variable "disk_size" {
  type        = number
  description = "The size, in megabytes, of the hard disk to create for the virtual machine."
}

variable "vboxmanage" {
  type        = list(list(string))
  description = "Custom VBoxManage commands to execute in order to further customize the virtual machine being created."
}

variable "iso_url" {
  type        = string
  description = "A URL to the ISO containing the installation image or virtual hard drive (VHD or VHDX) file to clone."
}

variable "iso_checksum" {
  type        = string
  description = "The checksum for the ISO file or virtual hard drive file."
}

variable "boot_command" {
  type        = list(string)
  description = "Array of commands to type when the virtual machine is first booted."
}

variable "http_directory" {
  type        = string
  description = "Path to a directory to serve using an HTTP server. The files in this directory will be available over HTTP that will be requestable from the virtual machine."
}

variable "shutdown_command" {
  type        = string
  description = "The command to use to gracefully shut down the machine once all the provisioning is done."
}

variable "guest_os_type" {
  type        = string
  description = "The guest OS type being installed."
}

variable "guest_additions_path" {
  type        = string
  description = "The path on the guest virtual machine where the VirtualBox guest additions ISO will be uploaded."
}

variable "ssh_timeout" {
  type        = string
  description = "The time to wait for SSH to become available."
}

variable "ssh_username" {
  type        = string
  description = "The username to connect to SSH with."
}

variable "ssh_password" {
  type        = string
  description = "A plaintext password to use to authenticate with SSH."
}

variable "ssh_handshake_attempts" {
  type        = number
  description = "The number of handshakes to attempt with SSH once it can connect."
}

variable "playbook_file" {
  type        = string
  description = "The playbook to be run by Ansible."
}

variable "ansible_env_vars" {
  type        = list(string)
  description = "Environment variables to set before running Ansible."
}

variable "vagrant_output" {
  type        = string
  description = "The full path to the box file that will be created by the vagrant post-processor."
}

variable "vagrant_box_tag" {
  type        = string
  description = "The shorthand tag for your box that maps to Vagrant Cloud. This box must already exist in Vagrant Cloud. Packer will not create the box automatically."
}

variable "vagrant_box_version" {
  type        = string
  description = "The version number, typically incrementing a previous version."
}
