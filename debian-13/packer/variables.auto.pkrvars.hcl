
vm_name = "debian-13-vbox"

disk_size = 10240

vboxmanage = [
  ["modifyvm", "{{ .Name }}", "--cpus", "1"],
  ["modifyvm", "{{ .Name }}", "--memory", "1024"]
]

iso_url      = "https://cdimage.debian.org/cdimage/archive/13.0.0/amd64/iso-cd/debian-13.0.0-amd64-netinst.iso"
iso_checksum = "sha256:e363cae0f1f22ed73363d0bde50b4ca582cb2816185cf6eac28e93d9bb9e1504"

boot_command = [
  "<esc><wait>",
  "install <wait>",
  " auto=true",
  " priority=critical",
  " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>",
  "<enter><wait>"
]

http_directory = "../http"

shutdown_command = "echo 'vagrant' | sudo --stdin shutdown --poweroff now"

guest_os_type        = "Debian_64"
guest_additions_path = "/tmp/VBoxGuestAdditions.iso"

ssh_timeout            = "10m"
ssh_username           = "vagrant"
ssh_password           = "vagrant"
ssh_handshake_attempts = 10


playbook_file    = "../ansible/debian-13-setup.yml"
ansible_env_vars = ["ANSIBLE_CONFIG=../ansible/ansible.cfg"]

vagrant_output = "../builds/debian-13.box"

vagrant_box_tag = "fernandobohrer/debian-13"
