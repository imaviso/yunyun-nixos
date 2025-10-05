{
  networking = {
    hostName = "nixos"; # Define your hostname.
    timeServers = [
      "0.ph.pool.ntp.org"
      "2.asia.pool.ntp.org"
      "0.asia.pool.ntp.org"
    ];
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    nameservers = [
      "192.168.254.2"
      "192.168.254.1"
    ];
    dhcpcd.extraConfig = "nohook resolv.conf";
    networkmanager.dns = "none";

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;

    # wg-quick.interfaces.wg0.configFile = "/etc/nixos/files/wireguard/wg0.conf";

    firewall = {
      enable = true;
      # if packets are still dropped, they will show up in dmesg
      logReversePathDrops = true;
      # wireguard trips rpfilter up
      extraCommands = ''
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 2408 -j RETURN
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 2408 -j RETURN
      '';
      extraStopCommands = ''
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 2408 -j RETURN || true
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 2408 -j RETURN || true
      '';

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

  #   services.dnsproxy = {
  #     enable = true;
  #     settings = {
  #       bootstrap = [ "1.1.1.1" "9.9.9.9" ];
  #       upstream = [ "https://d.adguard-dns.com/dns-query/a9d5463c" ];
  #       fallback = [ "https://adblock.dns.mullvad.net/dns-query" ];
  #       cache = true;
  #       cache-optimistic = true;
  #       cache-size = 2097152;
  #       cache-min-ttl = 3600;
  #       cache-max-ttl = 86400;
  #       listen-addrs = [ "0.0.0.0" ];
  #       listen-ports = [ 53 ];
  #     };
  #   };
}
