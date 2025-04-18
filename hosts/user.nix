{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../nixos
  ];

  users = { 
    defaultUserShell = pkgs.zsh;
    users.yunyun= {
      isNormalUser = true;
      description = "yunyun";
      createHome = true;
      home = "/home/yunyun";
      extraGroups = [ "wheel" "users" "networkmanager" "docker" "video" "plugdev" "input" ];
    };
  };
}


