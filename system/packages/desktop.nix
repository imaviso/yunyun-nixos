# Desktop-specific packages
{
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Browsers
    firefox
    brave

    # Office & productivity
    libreoffice-fresh
    thunderbird

    # Media
    mpv
    obs-studio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
    # handbrake
    # losslesscut-bin
    mkvtoolnix
    mpv-handler

    # Audio
    pavucontrol

    # Communication
    telegram-desktop
    teams-for-linux

    # Utilities
    img2pdf
    tesseract
    pdfsam-basic

    # Security
    authenticator
  ];
}
