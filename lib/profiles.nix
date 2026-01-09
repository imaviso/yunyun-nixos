# Reusable profiles for common configurations
# Profiles bundle together related modules for easy host configuration
{
  nixosModules,
  homeModules,
}: {
  desktop = {
    nixos = with nixosModules; [
      config.all
      nix
      packages.all
      services.adb
      services.audio
      services.lact
      services.keyboard
      services.scx
      services.ssh
      services.sunshine
      services.tailscale
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
      services.ghostty
      services.polkit-agent
    ];
  };

  laptop = {
    nixos = with nixosModules; [
      config.xdg
      config.i18n
      config.fonts
      nix
      packages.core
      packages.development
      services.scx
      services.audio
      services.keyboard
      services.ssh
      services.tailscale
      services.docker
      programs.terminal
      programs.thunar
      programs.chromium
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
      services.footserver
      services.clipboard
      services.polkit-agent
    ];
  };

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
}
