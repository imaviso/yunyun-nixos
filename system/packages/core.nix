# Common system packages
# These are packages that should be available system-wide
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Core utilities
    dash
    wget
    curl
    git

    # System tools
    psmisc
    libnotify
    btop
    lsof
    nmap
    unzip
    p7zip-rar

    # Modern CLI tools
    ripgrep
    fd
    jq
    bat
    eza
    dust
    fzf
    rbw
    rofi-rbw
    pinentry-all
    wtype

    # Development
    jujutsu
    lazygit
    bun
    nodejs

    inputs.run0-sudo-shim.packages.${pkgs.stdenv.hostPlatform.system}.default

    # System info
    fastfetch
    inputs.machinereport.packages.${pkgs.stdenv.hostPlatform.system}.default
    vulkan-tools
    libva-utils
    mediainfo
  ];
}
