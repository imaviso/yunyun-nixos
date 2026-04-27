{
  pkgs,
  username,
  settings,
  ...
}: {
  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      jay = {
        prettyName = "jay";
        comment = "jay compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/jay run";
      };
    };
  };

  security.polkit.enable = true;
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    jay
    xwayland
    gpu-screen-recorder
    brightnessctl
    matugen
    cava
    wlsunset
    app2unit
    apple-cursor
    papirus-icon-theme
    nwg-look
    colloid-gtk-theme
    font-manager
    hyprpicker
    swappy
    slurp
    grim
    wl-clipboard
    cliphist
    wl-screenrec
    wlopm
    kdePackages.qtsvg
    kdePackages.kio-fuse
    kdePackages.kio-extras
    kdePackages.dolphin
  ];

  security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    # needed for GNOME services outside of GNOME Desktop
    greetd = {
      enable = true;
      package = pkgs.greetd;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet -r -t --asterisks --cmd 'uwsm start -- jay-uwsm.desktop'";
          # user = username;
        };
      };
    };

    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];

    dbus.implementation = "broker";
    gnome.gnome-keyring.enable = true;

    gvfs.enable = true;

    # profile-sync-daemon
    psd = {
      enable = true;
      resyncTimer = "10m";
    };
  };

  programs.dconf.enable = true;

  qt = {
    enable = true;
    # platformTheme = settings.appearance.qtPlatformTheme;
    # style = settings.appearance.qtStyle;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [
        "gtk"
        "gnome"
      ];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
