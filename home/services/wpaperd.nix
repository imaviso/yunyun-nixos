{ config, ... }:
{
  services.wpaperd = {
    enable = true;
    settings = {
      DP-3 = {
        path = "${config.home.homeDirectory}/Pictures/Wallpapers";
      };
      HDMI-A-1 = {
        path = "${config.home.homeDirectory}/Pictures/Wallpapers2";
      };
    };
  };
}
