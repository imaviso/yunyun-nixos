{ pkgs, ... }:
{
  systemd.user.services.kanshi = {
    Unit.Description = "kanshi";
    Install = {
      WantedBy = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.kanshi}/bin/kanshi";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
