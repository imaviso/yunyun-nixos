{ config, lib, pkgs, inputs, ...}: {

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  programs.hyprland = {
    enable = true; 
    withUWSM = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    kitty
    walker 
    hyprpanel
    swww
    apple-cursor
    colloid-icon-theme
    nwg-look
    colloid-gtk-theme
    (orchis-theme.override {
      tweaks = [ "black" ];
    })
    font-manager
    nautilus
    xfce.thunar
    hyprpicker
    swappy
    slurp
    grim
    grimblast
    wl-clipboard
    cliphist
    wl-screenrec
    fuzzel
    pavucontrol
  ];

  # services.greetd = {
  #   enable = true;
  #   package = pkgs.greetd;
  #   vt = 7;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet} -r -t --asterisks --cmd 'uwsm start -S hyprland-uwsm.desktop'";
  #     };
  #   };
  # };

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

  # security.pam.services.greetd.enableGnomeKeyring = true;

  services = {
    # needed for GNOME services outside of GNOME Desktop
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
      common.default = ["gtk"];
      hyprland.default = ["gtk" "hyprland"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
    };
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
