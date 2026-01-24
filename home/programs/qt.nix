{
  pkgs,
  config,
  ...
}: {
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  # Configure qt5ct to use the generated Caelestia colors
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt5ct/colors/caelestia.colors
    custom_palette=true
    icon_theme=Papirus-Dark
    standard_dialogs=default
    style=Darkly

    [Fonts]
    fixed="Monospace,12,-1,5,50,0,0,0,0,0"
    general="Sans Serif,12,-1,5,50,0,0,0,0,0"
  '';

  # Configure qt6ct
  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    color_scheme_path=${config.xdg.configHome}/qt6ct/colors/caelestia.colors
    custom_palette=true
    icon_theme=Papirus-Dark
    standard_dialogs=default
    style=Darkly

    [Fonts]
    fixed="Monospace,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
    general="Sans Serif,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1"
  '';

  home.packages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    papirus-icon-theme
  ];
}
