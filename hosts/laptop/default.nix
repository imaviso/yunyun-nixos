# To add this host:
# 1. Generate hardware configuration: nixos-generate-config --show-hardware-config > hardware.nix
# 2. Customize this file for your laptop
# 3. Uncomment the laptop entry in flake.nix
{
  config,
  lib,
  pkgs,
  inputs,
  hostname,
  username,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

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
        "video"
        "input"
      ];
    };
  };

  # Laptop-specific settings
  services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;

  # TLP for battery optimization (alternative to power-profiles-daemon)
  # services.tlp.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    fastfetch
    btop
    ripgrep
    bat
    eza
    fd
    fzf

    brightnessctl
    firefox
    chromium
    brave
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;

  system.stateVersion = "24.05";
}
