{ config, lib, pkgs, ... }:

{
  imports = [
    ../system
  ];

  users = { 
    defaultUserShell = pkgs.zsh;
    users.yunyun= {
      isNormalUser = true;
      description = "yunyun";
      createHome = true;
      home = "/home/yunyun";
      extraGroups = [ "wheel" "users" "networkmanager" "docker" "video" "plugdev" "input" "libvirtd" ];
    };
  };
}


