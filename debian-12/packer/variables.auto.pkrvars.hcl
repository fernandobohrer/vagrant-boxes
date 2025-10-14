
vm_name = "debian-12-vbox"

disk_size = 10240

vboxmanage = [
  ["modifyvm", "{{ .Name }}", "--cpus", "1"],
  ["modifyvm", "{{ .Name }}", "--memory", "1024"]
]

iso_url      = "https://cdimage.debian.org/cdimage/archive/12.0.0/amd64/iso-cd/debian-12.0.0-amd64-netinst.iso"
iso_checksum = "sha256:3b0e9718e3653435f20d8c2124de6d363a51a1fd7f911b9ca0c6db6b3d30d53e"

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


playbook_file    = "../ansible/debian-12-setup.yml"
ansible_env_vars = ["ANSIBLE_CONFIG=../ansible/ansible.cfg"]

vagrant_output = "../builds/debian-12.box"

vagrant_box_tag = "fernandobohrer/debian-12"
