# wat.gif
Looking to setup a pfsense/opnsense guest in KVM/QEMU but never done this before, starting points appear to be:
 - [QEMU xml documentation](https://libvirt.org/formatdomain.html)
 - [Alex Bakker's Blog](https://alexbakker.me/post/nixos-pci-passthrough-qemu-vfio.html) - for a similar yet not the same setup
 - [Proxmox PCI passthrough setup](https://pve.proxmox.com/wiki/Pci_passthrough) as validation of required steps needing to be configured declaratively
 - [nix toXML and toFile builtins](https://nixos.org/manual/nix/unstable/expressions/builtins.html) to write files required
