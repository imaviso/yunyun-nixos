{config, ...}: {
  services.rtorrent = {
    enable = true;
    openFirewall = true;
    user = "yunyun";
    group = "users";
    configText = ''
      # Enable DHT, PEX and UDP trackers for public torrents
      dht.mode.set = auto
      protocol.pex.set = yes
      trackers.use_udp.set = yes
    '';
  };

  networking.firewall.allowedUDPPorts = [config.services.rtorrent.port];
}
