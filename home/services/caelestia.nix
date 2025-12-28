{inputs, ...}: {
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true;
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      appearance = {
        font.family = {
          clock = "Geist";
          mono = "TX-02";
          sans = "Geist";
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
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = true;
      };
    };
  };
}
