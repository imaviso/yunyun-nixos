{ pkgs, ...}: {

  programs.dconf.enable = true;

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  environment.systemPackages = with pkgs; [ 
    adwaita-icon-theme
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.gsconnect
    gnomeExtensions.pano
    gnomeExtensions.just-perfection
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-shell
    gnomeExtensions.rounded-window-corners-reborn
    apple-cursor
    gnome-screenshot
  ];

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

  environment.gnome.excludePackages = (with pkgs; [
    atomix # puzzle game
    cheese # webcam tool
    epiphany # web browser
    evince # document viewer
    geary # email reader
    gedit # text editor
    gnome-characters
    gnome-music
    gnome-photos
    gnome-terminal
    gnome-tour
    hitori # sudoku game
    iagno # go game
    tali # poker game
    totem # video player
  ]);
}
