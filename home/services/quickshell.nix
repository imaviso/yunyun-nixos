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
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableSystemd = true;
    enableDynamicTheming = false;
    enableBrightnessControl = false;
  };
  # home.packages = [
  #   pkgs.quickshell f
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
