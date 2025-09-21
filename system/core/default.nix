{ inputs, pkgs, ...}: {
  imports = [
    ./hardware.nix
    ./networking.nix
    ./fonts.nix
    ./i18n.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.variables.FREETYPE_PROPERTIES = "truetype:interpreter-version=40 cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
  environment.systemPackages = with pkgs; [
     neovim
     helix
     wget
     curl
     git
     fastfetch
     nitch
     nmap
     btop
     mediainfo
     clang
     unzip
     zig
     go
     cargo
     rustc
     rust-analyzer
     rustfmt
     #python3Full
     jdk
     maven
     ripgrep
     bat
     eza
     fd
     jq
     p7zip-rar
     lazygit
     zellij
     uv
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
     heroic
     gamescope
     libreoffice-fresh
     vesktop
     youtube-music
     teams-for-linux
     mpv
     img2pdf
     tesseract
     imagemagick
     feishin
     bbe
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        droidcam-obs
      ];
    })
     dbeaver-bin
     mission-center
     vulkan-tools
     glxinfo
     libva-utils
     android-tools
     scrcpy
     pdfsam-basic
     gnome-disk-utility
     wgcf
     wireguard-tools
     mkvtoolnix
     obs-studio
     handbrake
     losslesscut-bin
     lsof
     komikku
     vial
     anydesk
     virt-manager
     sbctl
     telegram-desktop
     woeusb-ng
     efibootmgr
     os-prober
     authenticator
     universal-android-debloater
     yt-dlp
     ffmpeg
     winetricks
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
