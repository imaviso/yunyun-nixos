{ pkgs, ...}: {

fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  liberation_ttf
  adwaita-fonts
  nerd-fonts.jetbrains-mono
  
];

}
