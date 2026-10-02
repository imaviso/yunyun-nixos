{pkgs, ...}: {
  systemd = {
    user.services.polkit-mate-authentication-agent-1 = {
      Unit = {
        Description = "polkit-mate-authentication-agent-1";
        After = ["graphical-session.target"];
        PartOf = ["graphical-session.target"];
      };

      Install.WantedBy = ["graphical-session.target"];
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.mate-polkit}/libexec/polkit-mate-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
