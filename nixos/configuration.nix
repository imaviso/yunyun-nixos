# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ inputs, config, pkgs, lib, ... }:
{

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
     neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
     curl
     git
     fastfetch
     nitch
     nmap
     btop
     mediainfo
     neovim
     clang
     unzip
     zig
     go
     cargo
     rustc
     rust-analyzer
     rustfmt
     python3Full
     jdk
     maven
     ripgrep
     eza
     fd
     lazygit
     zellij
     zoxide
     starship
     fzf
     nodejs
     bun
     pnpm
     yazi
     firefox
     brave
     chromium
     ghostty
     foot
     bottles
     heroic
     libreoffice-fresh
     easyeffects
     vesktop
     youtube-music
     teams-for-linux
     mpv
     img2pdf
     tesseract
     imagemagick
     wl-clipboard
     feishin
     bbe
     inputs.nix-gaming.packages.${pkgs.system}.wine-tkg # installs a package
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        droidcam-obs
      ];
    })
     dbeaver-bin
     zed-editor
     vscode
     code-cursor
     windsurf
     mission-center
     vulkan-tools
     glxinfo
     libva-utils
     gamemode
     android-tools
     scrcpy
     pdfsam-basic
     gnome-disk-utility
     wgcf
     wireguard-tools
     mkvtoolnix
     obs-studio
     handbrake
     lsof
     komikku
     vial
     anydesk
     virt-manager
     moonlight-qt
     remmina
     sbctl
  ];
  


 
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };



  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
