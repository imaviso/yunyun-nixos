{
  services.qbittorrent = {
    enable = true;
    extraArgs = [
      "--confirm-legal-notice"
    ];
    openFirewall = true;
    user = "yunyun";
    group = "users";
  };
}
