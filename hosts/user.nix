{ config, lib, pkgs, ... }:



{

  imports = [
    ./hardware-configuration.nix
    ../nixos/minimal.nix
  ];

  users = {
    users.yunyun= {
      isNormalUser = true;
      description = "yunyun";
      createHome = true;
      home = "/home/yunyun";
      extraGroups = [ "wheel" "users" "networkmanager" ];
    };
  };
}


