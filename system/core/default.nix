{
  inputs,
  pkgs,
  ...
}: {
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
    dash
    neovim
    wget
    curl
    git
    fastfetch
    microfetch
    nmap
    btop
    mediainfo
    unzip
    ripgrep
    dust
    bat
    eza
    fd
    jq
    bun
    p7zip-rar
    lazygit
    fzf
    firefox
    brave
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
    feishin
    # (pkgs.wrapOBS {
    #   plugins = with pkgs.obs-studio-plugins; [
    #     wlrobs
    #     obs-backgroundremoval
    #     obs-pipewire-audio-capture
    #     droidcam-obs
    #   ];
    # })
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
    pavucontrol
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
