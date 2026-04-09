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
  # services.power-profiles-daemon.enable = true;
  services.thermald.enable = true;
  services.logind.settings.Login.HandleLidSwitch = "ignore";
  services.scx = {
    enable = true;
    scheduler = "scx_rusty";
  };

  # TLP for battery optimization (alternative to power-profiles-daemon)
  services.tlp = {
    enable = true;
    settings = {
      START_CHARGE_THRESH_BAT0 = 70;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

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

  networking = {
    hostName = hostname;
    networkmanager = {
      enable = true;
      dns = "none";
    };
    firewall.extraCommands = ''
      iptables -A INPUT -s 192.168.254.0/24 -j ACCEPT
    '';
  };

  system.stateVersion = "24.05";
}
