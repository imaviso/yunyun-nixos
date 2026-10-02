{
  pkgs,
  inputs,
  ...
}: {
  systemd.user.services.ghostty = {
    Unit = {
      Description = "ghostty";
      After = ["graphical-session.target"];
      PartOf = ["graphical-session.target"];
    };
    Install.WantedBy = ["graphical-session.target"];
    Service = {
      Type = "simple";
      ExecStart = "${
        # inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
        pkgs.ghostty
      }/bin/ghostty --gtk-single-instance=true --initial-window=false";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };
}
