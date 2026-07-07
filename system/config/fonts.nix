{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    liberation_ttf
    inter
    roboto
    google-fonts
    nerd-fonts.jetbrains-mono
    material-symbols
    nerd-fonts.symbols-only
    font-awesome
    font-awesome_6
    source-sans
    source-sans-pro
    ioskeley-mono.normal-NF
  ];
}
