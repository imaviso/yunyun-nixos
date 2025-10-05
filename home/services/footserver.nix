{ pkgs, ... } : {
  systemd.user.services.footserver = {
      Unit.Description = "footserver";
      Install = {
        WantedBy = [ "graphical-session.target" ];
        Wants = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Service = {
      Type = "simple";
      ExecStart = "${pkgs.foot}/bin/foot -s";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
