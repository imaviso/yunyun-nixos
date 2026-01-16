{
  inputs,
  settings,
  config,
  ...
}: {
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
          clock = settings.fonts.sans;
          mono = settings.fonts.mono;
          sans = settings.fonts.sans;
        };
        rounding.scale = 1.0;
      };
      border.rounding = settings.layout.cornerRadius;
      bar.status = {
        showBattery = true;
        showAudio = true;
      };
      general = {
        apps = {
          "terminal" = [settings.apps.terminal];
          "explorer" = [settings.apps.fileManager];
          "playback" = [settings.apps.playback];
        };
        idle = {
          lockBeforeSleep = true;
          inhibitWhenAudio = true;
          timeouts = [
            {
              timeout = 300;
              idleAction = "lock";
            }
            {
              timeout = 600;
              idleAction = "dpms off";
              returnAction = "dpms on";
            }
            {
              timeout = 1200;
              idleAction = ["systemctl" "suspend"];
            }
          ];
        };
      };
      services = {
        weatherLocation = "Cebu";
        useFahrenheit = false;
      };
      paths.wallpaperDir = "~/${settings.paths.wallpapers}";
    };
    cli = {
      enable = true;
      settings = {
        theme = {
          enableTerm = true;
          enableHypr = true;
          enableGtk = true;
          enableQt = true;
          enableDiscord = true;
          enableSpicetify = false;
          enableFuzzel = true;
          enableBtop = true;
          enableCava = true;
        };
      };
    };
  };
}
