# Home Manager Modules
# Import this file and pick the modules you want to use
# Example: modules.home.terminal.helix or modules.home.wayland.hyprland
{
  fontconfig = ../../home/fontconfig.nix;
  cursor = ../../home/cursor.nix;
  theme = ../../home/theme;
  xdg = ../../home/xdg.nix;
  git = ../../home/git.nix;

  terminal = {
    all = ../../home/terminal;
    editors = {
      helix = ../../home/terminal/editors/helix;
      neovim = ../../home/terminal/editors/neovim;
    };
    emulators = {
      foot = ../../home/terminal/emulators/foot.nix;
      ghostty = ../../home/terminal/emulators/ghostty.nix;
      kitty = ../../home/terminal/emulators/kitty.nix;
    };
    shell = {
      fish = ../../home/terminal/shell/fish.nix;
      starship = ../../home/terminal/shell/starship.nix;
      zsh = ../../home/terminal/shell/zsh.nix;
    };
    yazi = ../../home/terminal/yazi.nix;
    zellij = ../../home/terminal/zellij.nix;
  };

  programs = {
    all = ../../home/programs;
    anyrun = ../../home/programs/anyrun;
    mpv = ../../home/programs/mpv.nix;
    betterfox = ../../home/programs/firefox.nix;
  };

  wayland = {
    all = ../../home/wayland;
    hyprland = ../../home/wayland/hyprland;
    labwc = ../../home/wayland/labwc;
    niri = ../../home/wayland/niri;
    wayfire = ../../home/wayland/wayfire;
  };

  services = {
    all = ../../home/services;
    caelestia = ../../home/services/caelestia.nix;
    clipboard = ../../home/services/clipboard.nix;
    easyeffects = ../../home/services/easyeffects;
    footserver = ../../home/services/footserver.nix;
    kanshi = ../../home/services/kanshi.nix;
    polkit-agent = ../../home/services/polkit-agent.nix;
    quickshell = ../../home/services/quickshell.nix;
    swayidle = ../../home/services/swayidle.nix;
    vicinae = ../../home/services/vicinae.nix;
    wpaperd = ../../home/services/wpaperd.nix;
  };
}
