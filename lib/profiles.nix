# Reusable profiles for common configurations
# Profiles bundle together related modules for easy host configuration
{ nixosModules, homeModules }:
{
  # Full desktop environment with gaming, streaming, etc.
  desktop = {
    nixos = with nixosModules; [
      config
      nix
      packages.all
      services.all
      programs.terminal
      programs.gaming
      programs.chromium
      programs.localsend
      programs.thunar
      programs.nix-ld
      wayland.hyprland
    ];
    home = with homeModules; [
      fontconfig
      cursor
      theme
      xdg
      git
      terminal.all
      programs.mpv
      programs.betterfox
      wayland.hyprland
      services.caelestia
      services.easyeffects
      services.clipboard
      services.footserver
      services.polkit-agent
    ];
  };

  # Minimal desktop (no gaming, lighter services)
  desktop-minimal = {
    nixos = with nixosModules; [
      config
      nix
      packages.core
      services.audio
      services.ssh
      programs.terminal
      programs.thunar
      wayland.hyprland
    ];
    home = with homeModules; [
      fontconfig
      cursor
      theme
      xdg
      git
      terminal.all
      wayland.hyprland
      services.clipboard
      services.polkit-agent
    ];
  };

  # Headless server
  server = {
    nixos = with nixosModules; [
      config
      nix
      packages.core
      services.ssh
      services.docker
    ];
    home = with homeModules; [
      terminal.all
      git
    ];
  };

  # Development workstation
  workstation = {
    nixos = with nixosModules; [
      config
      nix
      packages.all
      services.all
      programs.terminal
      programs.thunar
      programs.nix-ld
      wayland.hyprland
    ];
    home = with homeModules; [
      fontconfig
      cursor
      theme
      xdg
      git
      terminal.all
      programs.mpv
      programs.betterfox
      wayland.hyprland
      services.clipboard
      services.polkit-agent
    ];
  };
}
