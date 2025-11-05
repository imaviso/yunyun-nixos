{pkgs, ...}: {
  programs.niri.enable = true;

  security.polkit.enable = true; # polkit
  # security.pam.services.swaylock = {};
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    gpu-screen-recorder
    brightnessctl
    matugen
    cava
    wlsunset
    app2unit
    apple-cursor
    colloid-icon-theme
    colloid-gtk-theme
    nwg-look
    font-manager
    nautilus
    swappy
    slurp
    grim
    wl-clipboard
    cliphist
    wl-screenrec
    wlopm
  ];

  security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    # needed for GNOME services outside of GNOME Desktop
    #
    greetd = {
      enable = true;
      package = pkgs.greetd;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet -r -t --asterisks --cmd 'niri-session'";
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
