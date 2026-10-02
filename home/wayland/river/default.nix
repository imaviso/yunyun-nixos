{
  config,
  settings,
  pkgs,
  ...
}: {
  wayland.windowManager.river = {
    enable = true;
    # uwsm owns graphical-session.target, HM must not fight it
    systemd.enable = false;
    package = pkgs.river;
    extraConfig = ''
      # signal uwsm that compositor is ready, publish WAYLAND_DISPLAY etc.
      uwsm finalize &
      swash
    '';
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "river";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = settings.appearance.gtkTheme;
    APP2UNIT_TYPE = "service";
    # QT_QPA_PLATFORMTHEME = settings.appearance.qtPlatformTheme;
    # QT_QPA_PLATFORMTHEME_QT6 = settings.appearance.qtPlatformTheme;
    # XKB_DEFAULT_LAYOUT = settings.input.keyboardLayout;
    # XKB_DEFAULT_VARIANT = settings.input.keyboardVariant;
    # XKB_DEFAULT_OPTIONS = settings.input.keyboardOptions;
  };
}
