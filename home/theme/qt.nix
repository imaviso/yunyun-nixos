{
  pkgs,
  config,
  settings,
  ...
}: {
  qt = {
    enable = true;
    platformTheme.name = settings.appearance.qtPlatformTheme;
    # style = {
    #   name = settings.appearance.qtStyle;
    # };
  };

  # home.file.".config/kdeglobals" = {
  #   text = ''
  #     ${builtins.readFile "${pkgs.kdePackages.breeze}/share/color-schemes/BreezeDark.colors"}
  #   '';
  # };
  #
  # home.packages = with pkgs; [
  #   libsForQt5.qt5ct
  #   kdePackages.qt6ct
  #   papirus-icon-theme
  # ];
}
