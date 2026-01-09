{
  pkgs,
  inputs,
  ...
}: {
  systemd.user.services.ghostty = {
    Unit.Description = "ghostty";
    Install = {
      WantedBy = ["graphical-session.target"];
      Wants = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${
        inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
      }/bin/ghostty --gtk-single-instance=true --initial-window=false";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
