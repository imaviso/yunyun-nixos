# Common system packages
# These are packages that should be available system-wide
{ pkgs, inputs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    # Core utilities
    dash
    wget
    curl
    git
    
    # System tools
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
    
    # Development
    jujutsu
    lazygit
    bun
    
    # System info
    fastfetch
    microfetch
    vulkan-tools
    libva-utils
    mediainfo
  ];
}
