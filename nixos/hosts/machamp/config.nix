{
  qemu-config = builtins.toXML {
    domain = {
      name = "machamp";
      uuid = "figure how to generate uuid";
    };
  };
}

# <domain type="kvm">
#   <name>opnsense</name>
#   <uuid>4b4512e7-ba58-45de-9d3b-3b9a227ab8bf</uuid>
#   <metadata>
#     <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
#       <libosinfo:os id="http://freebsd.org/freebsd/12.1"/>
#     </libosinfo:libosinfo>
#   </metadata>
#   <memory unit="KiB">4194304</memory>
#   <currentMemory unit="KiB">4194304</currentMemory>
#   <vcpu placement="static">4</vcpu>
#   <os>
#     <type arch="x86_64" machine="pc-i440fx-6.0">hvm</type>
#   </os>
#   <features>
#     <acpi/>
#     <apic/>
#     <vmport state="off"/>
#   </features>
#   <cpu mode="host-model" check="partial"/>
#   <clock offset="utc">
#     <timer name="rtc" tickpolicy="catchup"/>
#     <timer name="pit" tickpolicy="delay"/>
#     <timer name="hpet" present="no"/>
#   </clock>
#   <on_poweroff>destroy</on_poweroff>
#   <on_reboot>restart</on_reboot>
#   <on_crash>destroy</on_crash>
#   <pm>
#     <suspend-to-mem enabled="no"/>
#     <suspend-to-disk enabled="no"/>
#   </pm>
#   <devices>
#     <emulator>/run/current-system/sw/bin/qemu-system-x86_64</emulator>
#     <disk type="file" device="disk">
#       <driver name="qemu" type="qcow2"/>
#       <!-- Below is just placeholder of generated config from alakazam -->
#       <source file="/home/jay/.local/share/libvirt/images/opnsense.qcow2"/>
#       <target dev="vda" bus="virtio"/>
#       <boot order="2"/>
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x07" function="0x0"/>
#     </disk>
#     <disk type="file" device="cdrom">
#       <driver name="qemu" type="raw"/>
#       <source file="/mnt/zfs/isos/x86_64/bsd/opnsense/OPNsense-21.7.1-OpenSSL-dvd-amd64.iso"/>
#       <target dev="hda" bus="ide"/>
#       <readonly/>
#       <boot order="1"/>
#       <address type="drive" controller="0" bus="0" target="0" unit="0"/>
#     </disk>
#     <controller type="usb" index="0" model="ich9-ehci1">
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x7"/>
#     </controller>
#     <controller type="usb" index="0" model="ich9-uhci1">
#       <master startport="0"/>
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x0" multifunction="on"/>
#     </controller>
#     <controller type="usb" index="0" model="ich9-uhci2">
#       <master startport="2"/>
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x1"/>
#     </controller>
#     <controller type="usb" index="0" model="ich9-uhci3">
#       <master startport="4"/>
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x05" function="0x2"/>
#     </controller>
#     <controller type="pci" index="0" model="pci-root"/>
#     <controller type="ide" index="0">
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x01" function="0x1"/>
#     </controller>
#     <controller type="virtio-serial" index="0">
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x06" function="0x0"/>
#     </controller>
#     <interface type="user">
#       <mac address="52:54:00:44:2c:b7"/>
#       <model type="virtio"/>
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x03" function="0x0"/>
#     </interface>
#     <serial type="pty">
#       <target type="isa-serial" port="0">
#         <model name="isa-serial"/>
#       </target>
#     </serial>
#     <console type="pty">
#       <target type="serial" port="0"/>
#     </console>
#     <channel type="spicevmc">
#       <target type="virtio" name="com.redhat.spice.0"/>
#       <address type="virtio-serial" controller="0" bus="0" port="1"/>
#     </channel>
#     <input type="mouse" bus="ps2"/>
#     <input type="keyboard" bus="ps2"/>
#     <graphics type="spice" autoport="yes">
#       <listen type="address"/>
#       <image compression="off"/>
#     </graphics>
#     <sound model="ich6">
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x04" function="0x0"/>
#     </sound>
#     <audio id="1" type="spice"/>
#     <video>
#       <model type="qxl" ram="65536" vram="65536" vgamem="16384" heads="1" primary="yes"/>
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x02" function="0x0"/>
#     </video>
#     <redirdev bus="usb" type="spicevmc">
#       <address type="usb" bus="0" port="1"/>
#     </redirdev>
#     <redirdev bus="usb" type="spicevmc">
#       <address type="usb" bus="0" port="2"/>
#     </redirdev>
#     <memballoon model="virtio">
#       <address type="pci" domain="0x0000" bus="0x00" slot="0x08" function="0x0"/>
#     </memballoon>
#   </devices>
# </domain>

