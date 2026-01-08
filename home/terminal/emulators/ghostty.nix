{
  inputs,
  pkgs,
  settings,
  ...
}: let
  colors = settings.colors;
in {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
    enableFishIntegration = true;
    settings = {
      font-family = settings.fonts.terminal;
      font-size = settings.fonts.terminalSize;
      gtk-single-instance = true;
      gtk-titlebar = false;
      window-decoration = true;
      window-padding-x = 10;
      window-padding-y = 10;
      theme = "minimal";
      confirm-close-surface = false;
    };
    themes = {
      minimal = {
        background = colors.background;
        foreground = colors.foreground;
        cursor-color = colors.borderActive;
        palette = [
          "0=#000000"
          "1=#f75f8f"
          "2=#62c073"
          "3=#ff9907"
          "4=#52a8ff"
          "5=#c472fb"
          "6=#1da9b0"
          "7=#a1a1a1"
          "8=#676767"
          "9=#f75f8f"
          "10=#62c073"
          "11=#ff9907"
          "12=#52a8ff"
          "13=#c472fb"
          "14=#1da9b0"
          "15=#FFFFFF"
        ];
        selection-background = colors.selection;
        selection-foreground = colors.foreground;
      };
    };
  };
}
