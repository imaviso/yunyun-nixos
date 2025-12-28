{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware.nix
    ../../system
  ];

  users = {
    defaultUserShell = pkgs.fish;
    users.yunyun = {
      isNormalUser = true;
      description = "yunyun";
      createHome = true;
      home = "/home/yunyun";
      extraGroups = [
        "wheel"
        "users"
        "networkmanager"
        "docker"
        "video"
        "plugdev"
        "input"
        "libvirtd"
        "adbusers"
      ];
    };
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    variables.FREETYPE_PROPERTIES = "truetype:interpreter-version=40 cff:no-stem-darkening=0 autofitter:no-stem-darkening=0";
    systemPackages = with pkgs; [
      dash
      wget
      curl
      git
      jujutsu
      fastfetch
      microfetch
      nmap
      btop
      mediainfo
      unzip
      ripgrep
      dust
      bat
      mpv
      eza
      fd
      jq
      bun
      p7zip-rar
      lazygit
      fzf
      firefox
      brave
      gamescope
      libreoffice-fresh
      youtube-music
      # teams-for-linux
      img2pdf
      tesseract
      feishin
      vesktop
      supersonic
      obs-studio
      (pkgs.wrapOBS {
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      })
      inputs.slothsonic.packages.${system}.default
      dbeaver-bin
      mission-center
      vulkan-tools
      libva-utils
      scrcpy
      pdfsam-basic
      wgcf
      wireguard-tools
      mkvtoolnix
      handbrake
      losslesscut-bin
      lsof
      komikku
      vial
      # anydesk
      telegram-desktop
      thunderbird
      authenticator
      universal-android-debloater
      pavucontrol
      tigervnc
    ];
  };

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
