{ config, lib, pkgs, inputs, ...}: {

  programs.hyprlock.enable = true;
  services.hypridle.enable = true;
  programs.hyprland = {
    enable = true; # enable Hyprland
    withUWSM = true;
    xwayland.enable = true;
  };
  
  nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
  environment.systemPackages = with pkgs; [
    kitty
    walker 
    hyprpanel
    swww
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

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
      command = "uwsm start -- hyprland-uwsm.desktop";
        user = "yunyun";
      };
      default_session = initial_session;
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;

  programs.dconf.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };
}
