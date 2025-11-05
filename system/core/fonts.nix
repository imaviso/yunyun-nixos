{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    inter
    roboto
    adwaita-fonts
    geist-font
    nerd-fonts.geist-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.adwaita-mono
    material-symbols
  ];
}
