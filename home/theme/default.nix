{
  config,
  lib,
  pkgs,
  ...
}:
{

  gtk = {
    enable = true;

    cursorTheme = {
      name = "macOS";
      package = pkgs.apple-cursor;
      size = 24;
    };

    font = {
      name = "SFProText Nerd Font";
      size = 10;
    };

    iconTheme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-icon-theme;
    };

    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

  };

  home.file."${config.xdg.configHome}/gtk-3.0/gtk.css".source = ./gtk3-dark.css;
  home.file."${config.xdg.configHome}/gtk-4.0/gtk.css".source = lib.mkForce ./gtk4-dark.css;

}
