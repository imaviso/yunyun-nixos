{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];

  programs.dank-material-shell = {
    enable = true;
    systemd.enable = true;
    # quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableDynamicTheming = false;
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
