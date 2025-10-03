{ pkgs, ... }:

let
  wallpaperPath = ./dan-otis.jpg; 

in
{
  home.packages = [
    pkgs.wbg
  ];

  systemd.user.services.wbg = {
    Unit.Description = "wbg";

    Install = {
      WantedBy = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.wbg}/bin/wbg -s ${wallpaperPath}";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
