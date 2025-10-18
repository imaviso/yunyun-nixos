{pkgs, ...}: {
  imports = [
    ./niri
  ];

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "niri";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = "adw-gtk3-dark";
    APP2UNIT_TYPE = "service";
  };

  home.packages = with pkgs; [
  ];
}
