{ pkgs, ...}: {
  
  home.packages = [
    pkgs.easyeffects
  ];

  systemd.user.services.easyeffects = {
    Unit.Description = "easyeffects";

    Install = {
      WantedBy = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.easyeffects}/bin/easyeffects --gapplication-service";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
