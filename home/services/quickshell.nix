{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
  ];

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableDynamicTheming = false;
    enableBrightnessControl = false;
  };
  # home.packages = [
  #   pkgs.quickshell
  # ];

  # systemd.user.services.quickshell = {
  #   Unit.Description = "quickshell";
  #   Install = {
  #     WantedBy = ["graphical-session.target"];
  #     Wants = ["graphical-session.target"];
  #     After = ["graphical-session.target"];
  #   };
  #
  #   Service = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.quickshell}/bin/qs -c noctalia-shell";
  #     Restart = "on-failure";
  #     RestartSec = 1;
  #     TimeoutStopSec = 10;
  #   };
  # };
}
