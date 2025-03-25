{
  networking = {
    hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
    networkmanager.enable = true;

    firewall = {
      enable = true;
    # allowedTCPPorts = [53 2283 3001 4533 4747 4000 4001 4002 20048 2049 111 139 445 8000 8081 9078 9091 51413];
    # allowedUDPPorts = [53 4747 4000 4001 4002 20048 2049 111 137 138 51413];
    #allowedUDPPortRanges = [
    #  { from = 8000; to = 8010; }
    #];
    #  # Open ports in the firewall.
  #networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
    };
  };
}
