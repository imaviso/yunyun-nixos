{pkgs, ...}: {
  # services.easyeffects = {
  #   enable = true;
  # };

  home.packages = [
    pkgs.easyeffects
  ];

  systemd.user.services.easyeffects = {
    Unit.Description = "easyeffects";
    Install = {
      WantedBy = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects -w";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
