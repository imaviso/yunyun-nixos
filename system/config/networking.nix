{
  lib,
  hostname,
  hostVars,
  ...
}: let
  # Get networking settings from hostVars with defaults
  networkingVars = hostVars.networking or {};
  backend = networkingVars.backend or "networkmanager";
  useNetworkManager = backend == "networkmanager";
  useNetworkd = backend == "networkd";
  nameservers = networkingVars.nameservers or ["1.1.1.1" "9.9.9.9"];
  timeServers = networkingVars.timeServers or ["time.cloudflare.com"];
  trustedSubnets = networkingVars.trustedSubnets or [];
  subnetAcceptRules =
    lib.concatMapStringsSep "\n" (subnet: ''
      iptables -A INPUT -s ${subnet} -j ACCEPT
    '')
    trustedSubnets;
  subnetAcceptStopRules =
    lib.concatMapStringsSep "\n" (subnet: ''
      iptables -D INPUT -s ${subnet} -j ACCEPT || true
    '')
    trustedSubnets;
in {
  networking = {
    hostName = hostname;
    inherit timeServers nameservers;

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networkmanager = {
      enable = useNetworkManager;
      dns = "systemd-resolved";
    };

    useNetworkd = useNetworkd;
    useDHCP = lib.mkIf useNetworkd false;

    # wg-quick.interfaces.wg0.configFile = "/etc/nixos/files/wireguard/wg0.conf";

    firewall = {
      enable = true;
      # if packets are still dropped, they will show up in dmesg
      logReversePathDrops = true;
      # wireguard trips rpfilter up
      extraCommands = ''
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 2408 -j RETURN
        ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 2408 -j RETURN
        ${subnetAcceptRules}
      '';
      extraStopCommands = ''
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 2408 -j RETURN || true
        ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 2408 -j RETURN || true
        ${subnetAcceptStopRules}
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

  systemd.network = lib.mkIf useNetworkd {
    enable = true;
    networks."10-wired-dhcp" = {
      matchConfig.Name = "en* eth*";
      networkConfig.DHCP = "yes";
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = nameservers;
      FallbackDNS = ["1.1.1.1" "9.9.9.9"];
    };
  };

  services.timesyncd = {
    enable = true;
    servers = timeServers;
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
