{
  inputs,
  pkgs,
  ...
}: {
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
    nerd-fonts.symbols-only
    inputs.berkeley-mono.packages.${pkgs.stdenv.hostPlatform.system}.berkeleyMono
    font-awesome
    font-awesome_6
    source-sans
    source-sans-pro
  ];
}
