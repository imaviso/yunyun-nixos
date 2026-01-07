{ inputs, ... }:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      appearance = {
        font.family = {
          clock = "Google Sans";
          mono = "TX-02";
          sans = "Google Sans";
        };
        rounding = {
          scale = 1.0;
        };
      };
      border = {
        rounding = 10;
      };
      bar.status = {
        showBattery = false;
        showAudio = true;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = true;
      };
    };
  };
}
