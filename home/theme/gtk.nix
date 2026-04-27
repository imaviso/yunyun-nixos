{
  config,
  lib,
  pkgs,
  settings,
  ...
}: {
  gtk = {
    enable = true;

    cursorTheme = {
      name = settings.appearance.cursor.name;
      package = pkgs.apple-cursor;
      size = settings.appearance.cursor.size;
    };

    font = {
      name = settings.fonts.sans;
      size = settings.fonts.uiSize;
    };

    iconTheme = {
      name = settings.appearance.iconTheme;
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = settings.appearance.gtkTheme;
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme =
        if settings.appearance.preferDark
        then 1
        else 0;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme =
        if settings.appearance.preferDark
        then 1
        else 0;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  xdg.configFile."gtk-4.0/gtk.css".enable = false;
}
