{
  networking.firewall = {
    allowedTCPPorts = [ 22 80 139 443 445 8200 9000 ];
    allowedUDPPorts = [ 137 138 ];
  };
}
