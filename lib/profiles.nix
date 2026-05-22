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
      # services.keyboard # plasma handles kbd via systemsettings
      # services.keyd #labwc
      services.scx
      services.ssh
      services.sunshine
      services.tailscale
      services.udev
      programs.terminal.fish
      programs.terminal.zoxide
      programs.gaming
      programs.chromium
      programs.localsend
      # programs.thunar
      programs.nix-ld
      wayland.kde
      # wayland.labwc
    ];
    home = with homeModules; [
      # fontconfig
      # cursor
      # theme.gtk
      # theme.qt
      # xdg
      git
      terminal.default
      programs.mpv
      programs.firefox
      wayland.kde.default
      # wayland.labwc.default
      # services.kanshi # labwc etc
      # services.dms
      services.easyeffects.default
      # services.clipboard
      services.footserver
      services.vicinae
      # services.ghostty
      # services.polkit-agent
    ];
  };

  laptop = {
    nixos = with nixosModules; [
      config.xdg
      config.i18n
      config.fonts
      config.networking
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
      programs.nix-ld
      wayland.hyprland
    ];
    home = with homeModules; [
      fontconfig
      cursor
      theme.gtk
      theme.qt
      xdg
      git
      terminal.default
      programs.mpv
      programs.firefox
      wayland.hyprland.default
      services.dms
      services.footserver
      # services.clipboard
      services.polkit-agent
    ];
  };

  server = {
    nixos = with nixosModules; [
      config.xdg
      config.i18n
      config.networking
      nix.default
      packages.core
      services.adguardhome
      services.bakarr
      services.docker
      services.filebrowser
      services.keyboard
      # services.komga
      services.ssh
      services.smb
      services.suboxide
      # services.scx
      services.tailscale
      services.qbittorrent
      programs.terminal.fish
      programs.terminal.zoxide
      programs.nix-ld
    ];
    home = with homeModules; [
      xdg
      git
      terminal.default
    ];
  };
}
