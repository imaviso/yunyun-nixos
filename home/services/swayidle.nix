{pkgs, ...}: {
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
      {
        timeout = 900;
        command = "${pkgs.systemd}/bin/systemctl hibernate";
      }
    ];
  };
}
