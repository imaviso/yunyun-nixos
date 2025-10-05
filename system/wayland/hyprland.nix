{ config, lib, pkgs, inputs, ...}: {

  # programs.hyprlock.enable = true;
  # services.hypridle.enable = true;
  programs.hyprland = {
    enable = true; 
    withUWSM = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    app2unit
    walker
    swww
    hyprpaper
    hyprpanel
    hyprpicker
    nwg-look
    font-manager
    nautilus
    swappy
    slurp
    grim
    grimblast
    wl-clipboard
    cliphist
    wl-screenrec
    fuzzel
    pavucontrol
    tuigreet
  ];

  services.greetd = {
    enable = true;
    package = pkgs.greetd;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -r -t --asterisks --cmd 'uwsm start hyprland-uwsm.desktop'";
        # user = "yunyun";
      };
    };
  };

  # services.greetd = {
  #   enable = true;
  #   settings = rec {
  #     initial_session = {
  #     command = "uwsm start -- hyprland-uwsm.desktop";
  #       user = "yunyun";
  #     };
  #     default_session = initial_session;
  #   };
  # };

  # services.greetd = let
  #   session = {
  #     command = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop";
  #     user = "yunyun";
  #   };
  # in {
  #   enable = true;
  #   settings = {
  #     terminal.vt = 1;
  #     default_session = session;
  #     initial_session = session;
  #   };
  # };

  security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    # needed for GNOME services outside of GNOME Desktop
    dbus.packages = with pkgs; [
      gcr
      gnome-settings-daemon
    ];

    dbus.implementation = "broker";
    gnome.gnome-keyring.enable = true;

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
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  security = {
    # allow wayland lockers to unlock the screen
    pam.services.hyprlock.text = "auth include login";

    # userland niceness
    rtkit.enable = true;

    # don't ask for password for wheel group
    sudo.wheelNeedsPassword = false;
  };

}
