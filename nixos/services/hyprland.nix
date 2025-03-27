{ config, lib, pkgs, inputs, ...}: {
  programs.hyprland.enable = true; # enable Hyprland
  nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
  environment.systemPackages = with pkgs; [
    kitty
    walker 
    hyprpanel
    swww
  ];
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
      command = "${pkgs.hyprland}/bin/Hyprland";
        user = "yunyun";
      };
      default_session = initial_session;
    };
  };
  
  security.pam.services.greetd.enableGnomeKeyring = true;

}
