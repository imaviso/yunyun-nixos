{pkgs, ...}: {
  programs.wayfire = {
    enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wcm
      wayfire-plugins-extra
      wayfire-shadows
      windecor
    ];
  };

  programs.uwsm = {
    enable = true;
    waylandCompositors = {
      wayfire = {
        prettyName = "Wayfire";
        comment = "Wayfire compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/wayfire";
      };
    };
  };

  security.polkit.enable = true; # polkit
  # security.pam.services.swaylock = {};
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    gpu-screen-recorder
    brightnessctl
    matugen
    cava
    wlsunset
    app2unit
    apple-cursor
    colloid-icon-theme
    nwg-look
    colloid-gtk-theme
    font-manager
    nautilus
    hyprpicker
    swappy
    slurp
    grim
    grimblast
    wl-clipboard
    cliphist
    wl-screenrec
    kanshi
    wlopm
  ];

  security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    # needed for GNOME services outside of GNOME Desktop
    greetd = {
      enable = true;
      package = pkgs.greetd;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet -r -t --asterisks --cmd 'uwsm start -- wayfire-uwsm.desktop'";
          # command = "${pkgs.tuigreet}/bin/tuigreet -r -t --asterisks --cmd 'wayfire'";
          # user = "yunyun";
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
    platformTheme = "gnome";
    style = "adwaita-dark";
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
