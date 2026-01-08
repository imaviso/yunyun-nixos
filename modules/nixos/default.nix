# NixOS Modules Registry
# Import this file and pick the modules you want to use
# Example: nixosModules.programs.gaming
{
  # System configuration
  config = {
    all = ../../system/config;
    xdg = ../../system/config/xdg.nix;
    i18n = ../../system/config/i18n.nix;
    fonts = ../../system/config/fonts.nix;
    networking = ../../system/config/networking.nix;
  };

  nix = ../../system/nix;

  # Packages (organized by category)
  packages = {
    all = ../../system/packages;
    core = ../../system/packages/core.nix;
    desktop = ../../system/packages/desktop.nix;
    development = ../../system/packages/development.nix;
    android = ../../system/packages/android.nix;
    networking = ../../system/packages/networking.nix;
    misc = ../../system/packages/misc.nix;
  };

  # Services
  services = {
    all = ../../system/services;
    adb = ../../system/services/adb.nix;
    audio = ../../system/services/audio.nix;
    docker = ../../system/services/docker.nix;
    flatpak = ../../system/services/flatpak.nix;
    keyboard = ../../system/services/keyboard.nix;
    lact = ../../system/services/lact.nix;
    libvirt = ../../system/services/libvirt.nix;
    podman = ../../system/services/podman.nix;
    scx = ../../system/services/scx.nix;
    ssh = ../../system/services/ssh.nix;
    sunshine = ../../system/services/sunshine.nix;
    tailscale = ../../system/services/tailscale.nix;
    udev = ../../system/services/udev.nix;
  };

  # Programs
  programs = {
    all = ../../system/programs;
    terminal = ../../system/programs/terminal;
    gaming = ../../system/programs/gaming.nix;
    chromium = ../../system/programs/chromium.nix;
    localsend = ../../system/programs/localsend.nix;
    nix-ld = ../../system/programs/nix-ld.nix;
    thunar = ../../system/programs/thunar.nix;
    an-anime-game = ../../system/programs/an-anime-game.nix;
  };

  # Wayland compositors
  wayland = {
    all = ../../system/wayland;
    hyprland = ../../system/wayland/hyprland.nix;
    cosmic = ../../system/wayland/cosmic.nix;
    labwc = ../../system/wayland/labwc.nix;
    niri = ../../system/wayland/niri.nix;
    plasma = ../../system/wayland/plasma.nix;
    wayfire = ../../system/wayland/wayfire.nix;
  };
}
