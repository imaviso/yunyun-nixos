{ pkgs, ... }: {
  
  programs.niri.enable = true;

  security.polkit.enable = true; # polkit
  security.pam.services.swaylock = {};
  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    waybar
    walker 
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
    mako
    swayidle
    swaylock
  ];

  services = {
    # needed for GNOME services outside of GNOME Desktop
    #

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
      common.default = ["gtk" "gnome"];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
