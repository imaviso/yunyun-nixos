{
  services.qbittorrent = {
    enable = true;
    extraArgs = [
      "--confirm-legal-notice"
    ];
    openFirewall = true;
  };
}
