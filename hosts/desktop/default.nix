# Desktop host configuration
{
  config,
  lib,
  pkgs,
  inputs,
  hostname,
  username,
  hostVars,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  # User configuration
  users = {
    defaultUserShell = pkgs.fish;
    users.${username} = {
      isNormalUser = true;
      description = username;
      createHome = true;
      home = "/home/${username}";
      extraGroups = [
        "wheel"
        "users"
        "networkmanager"
        "docker"
        "video"
        "plugdev"
        "input"
        "libvirtd"
        "adbusers"
      ];
    };
  };

  # Environment variables
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    variables.FREETYPE_PROPERTIES = "truetype:interpreter-version=40 cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  };

  # System packages are now managed in system/packages/
  # Host-specific packages that don't fit elsewhere can go here:
  # environment.systemPackages = with pkgs; [ ];

  system.stateVersion = "24.05";
}
