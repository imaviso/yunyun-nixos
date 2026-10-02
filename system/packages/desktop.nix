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
    brave-origin

    # Office & productivity
    libreoffice-stable
    thunderbird

    # Media
    mpv
    feishin
    obs-studio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
        droidcam-obs
      ];
    })
    droidcam
    handbrake
    losslesscut-bin
    mkvtoolnix
    mpv-handler

    # Audio
    pavucontrol

    # Communication
    telegram-desktop
    teams-for-linux
    vesktop

    # Utilities
    img2pdf
    tesseract
    pdfsam-basic

    # Security
    authenticator

    varia
  ];
}
