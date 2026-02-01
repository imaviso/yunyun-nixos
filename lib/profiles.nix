# Reusable profiles for common configurations
# Profiles bundle together related modules for easy host configuration
{
  nixosModules,
  homeModules,
}: {
  desktop = {
    nixos = with nixosModules; [
      config.default
      nix.default
      packages.android
      packages.core
      packages.desktop
      packages.development
      packages.misc
      packages.networking
      services.adb
      services.audio
      services.lact
      services.keyboard
      services.scx
      services.ssh
      services.sunshine
      services.tailscale
      programs.terminal.fish
      programs.terminal.zoxide
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
      theme.default
      xdg
      git
      terminal.default
      programs.mpv
      programs.qt
      programs.firefox
      wayland.hyprland.default
      services.caelestia
      services.easyeffects.default
      services.clipboard
      services.footserver
      # services.ghostty
      services.polkit-agent
    ];
  };

  laptop = {
    nixos = with nixosModules; [
      config.xdg
      config.i18n
      config.fonts
      nix.default
      packages.core
      packages.development
      services.scx
      services.audio
      services.keyboard
      services.ssh
      services.tailscale
      services.docker
      programs.terminal.fish
      programs.terminal.zoxide
      programs.thunar
      programs.chromium
      wayland.hyprland
    ];
    home = with homeModules; [
      fontconfig
      cursor
      theme.default
      xdg
      git
      terminal.default
      programs.mpv
      programs.qt
      programs.firefox
      wayland.hyprland.default
      services.caelestia
      services.footserver
      services.clipboard
      services.polkit-agent
    ];
  };
}
