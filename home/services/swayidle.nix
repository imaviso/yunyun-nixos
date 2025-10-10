{ pkgs, ... }:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.quickshell}/bin/qs -c noctalia-shell ipc call lockScreen toggle";
      }
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
