{ config, lib, monitors ? [], ... }:
let
  # Generate wpaperd settings for each monitor
  # Primary monitor uses Wallpapers, others use Wallpapers2, Wallpapers3, etc.
  mkWpaperdSettings = monitors:
    lib.listToAttrs (lib.imap0 (i: m: {
      name = m.name;
      value = {
        path = if m.primary or false
          then "${config.home.homeDirectory}/Pictures/Wallpapers"
          else "${config.home.homeDirectory}/Pictures/Wallpapers${toString (i + 1)}";
      };
    }) monitors);
in
{
  services.wpaperd = {
    enable = monitors != [];
    settings = mkWpaperdSettings monitors;
  };
}
