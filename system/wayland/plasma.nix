{ pkgs, ...}: {

  services.xserver.enable = true;
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    settings.General.DisplayServer = "wayland";
  };
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    oxygen
    elisa
    kate
  ];
  environment.systemPackages = with pkgs; [
    kdePackages.kcalc # Calculator
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland
    walker
  ];

}
