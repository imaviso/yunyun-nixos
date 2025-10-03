{ pkgs, ... } : {
  
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
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

  };
}
