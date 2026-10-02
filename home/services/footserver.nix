{pkgs, ...}: {
  systemd.user.services.footserver = {
    Unit = {
      Description = "footserver";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };
    Install.WantedBy = ["graphical-session.target"];
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.foot}/bin/foot -s";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
