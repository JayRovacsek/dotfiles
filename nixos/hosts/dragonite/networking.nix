{
  networking = {
    wireless.enable = false;
    hostId = "acd009f4";
    hostName = "dragonite";
    useDHCP = false;
    interfaces.enp9s0.useDHCP = true;
  };

  networking.firewall = {
    allowedTCPPorts = [ 22 80 139 443 445 8200 9000 ];
    allowedUDPPorts = [ 137 138 ];
  };
}
