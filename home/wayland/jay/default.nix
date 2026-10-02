{settings, ...}: {
  # jay launched via uwsm (system/wayland/jay.nix).
  # Manual dbus-update-activation-environment removed: uwsm owns env +
  # graphical-session.target. Run `uwsm finalize` from jay on-startup once
  # jay config exists.
  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "jay";
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
