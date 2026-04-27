{
  config,
  settings,
  pkgs,
  lib,
  ...
}: let
  variables = builtins.concatStringsSep " " [
    "DISPLAY"
    "WAYLAND_DISPLAY"
    "XDG_CURRENT_DESKTOP"
    "NIXOS_OZONE_WL"
    "XCURSOR_THEME"
    "XCURSOR_SIZE"
  ];
  systemdActivation = "${pkgs.dbus}/bin/dbus-update-activation-environment --systemd ${variables}";
in {
  # home.file."${config.xdg.configHome}/jay/config.toml".text = ''
  #   on-startup = { type = "exec", exec = { shell = "${systemdActivation}" } }
  #
  #   ${builtins.readFile ./config.toml}
  # '';

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "jay";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "jay";
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
