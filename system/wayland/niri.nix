{
  pkgs,
  inputs,
  username,
  settings,
  ...
}: {
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  programs = {
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    dank-material-shell.greeter = {
      enable = true;
      compositor.name = "niri";
      quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
      configHome = "/home/${username}";
      configFiles = ["/home/${username}/.config/DankMaterialShell/settings.json"];
    };
  };

  security = {
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
    pam.services.greetd.enableGnomeKeyring = true;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    gpu-screen-recorder
    brightnessctl
    matugen
    cava
    wlsunset
    app2unit
    apple-cursor
    papirus-icon-theme
    colloid-gtk-theme
    nwg-look
    font-manager
    swappy
    slurp
    grim
    wl-clipboard
    cliphist
    wl-screenrec
    wlopm
  ];

  services = {
    # needed for GNOME services outside of GNOME Desktop

    # greetd = {
    #   enable = true;
    #   package = pkgs.greetd;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.tuigreet}/bin/tuigreet -r -t --asterisks --cmd 'niri-session'";
    #       # user = username;
    #     };
    #   };
    # };

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
    platformTheme = settings.appearance.qtPlatformTheme;
    style = settings.appearance.qtStyle;
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
