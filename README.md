# Vagrant Boxes

This repository concentrates the files used to build the Vagrant boxes I maintain in the [Vagrant Public Registry][01].

## 🚀 Motivation

The Vagrant boxes that are created from this repository can be used, for example, to test [Ansible][02] roles and playbooks using [Molecule][03].

## 📦 Build process

The Vagrant boxes are built using [Packer][04] and [VirtualBox][05]. Additional configuration steps executed during the image creation phase are performed via [Ansible][02]. To get additional details about a specific Vagrant box, check the directory associated to it.

By default, the Vagrant boxes configuration is set to send the built artifact to the Vagrant Public Registry using the [vagrant-cloud][06] post-processor. To interact with the Vagrant Public Registry, the [vagrant-cloud][06] post-processor relies on the `VAGRANT_CLOUD_TOKEN` environment variable.

To set the `VAGRANT_CLOUD_TOKEN` environment variable, deploy the [hcp cli][07] locally and follow the steps below:

```bash
hcp auth login
```

```bash
export VAGRANT_CLOUD_TOKEN=$(hcp auth print-access-token)
```

After having set the `VAGRANT_CLOUD_TOKEN` environment variable, the command below can be used to build a Vagrant box:

```bash
make build image=[image-id]
```

To build the `debian-13` box, execute:

```bash
make build image=debian-13
```

## 🏗️ Vagrant Boxes

If you just want to use a Vagrant box built from the files in this repository without having to build the box yourself, execute a `vagrant box add` command using as argument the id of box you want to download:

```bash
vagrant box add fernandobohrer/[image-id]
```

To download the `debian-13` box, execute:

```bash
vagrant box add fernandobohrer/debian-13
```

Alternatively, run a `vagrant init fernandobohrer/[image-id]` command, followed by a `vagrant up` command:

```bash
vagrant init fernandobohrer/debian-13
```

```bash
vagrant up
```

The above commands will start a VirtualBox based virtual machine locally that can be accessed via the `vagrant ssh` command.

To destroy the local VirtualBox based virtual machine, run:

```bash
vagrant destroy --force
```

## ⚠️ Warning

Use this repository and the Vagrant boxes that are created from it at your own risk!

## 📝 License

This project is licensed under the terms of the [MIT license][08].

[01]: https://portal.cloud.hashicorp.com/vagrant/discover?query=fernandobohrer
[02]: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
[03]: https://github.com/fernandobohrer/ansible-molecule-scenarios
[04]: https://developer.hashicorp.com/packer
[05]: https://www.virtualbox.org/
[06]: https://developer.hashicorp.com/packer/integrations/hashicorp/vagrant/latest/components/post-processor/vagrant-cloud
[07]: https://developer.hashicorp.com/hcp/docs/cli
[08]: /LICENSE
