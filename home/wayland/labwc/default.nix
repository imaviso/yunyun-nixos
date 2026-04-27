{
  config,
  lib,
  settings,
  ...
}: let
  labwcConfigDir = "${config.xdg.configHome}/labwc";
in {
  wayland.windowManager.labwc = {
    enable = true;
    systemd.enable = true;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "labwc:wlroots";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "labwc:wlroots";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = settings.appearance.gtkTheme;
    APP2UNIT_TYPE = "service";
    # QT_QPA_PLATFORMTHEME = settings.appearance.qtPlatformTheme;
    # QT_QPA_PLATFORMTHEME_QT6 = settings.appearance.qtPlatformTheme;
    WLR_RENDERER = "vulkan";
    XKB_DEFAULT_LAYOUT = settings.input.keyboardLayout;
    # XKB_DEFAULT_VARIANT = settings.input.keyboardVariant;
    # XKB_DEFAULT_OPTIONS = settings.input.keyboardOptions;
  };

  home.file = {
    "${labwcConfigDir}/rc.xml".source = ./rc.xml;
    "${labwcConfigDir}/menu.xml".source = ./menu.xml;
    "${labwcConfigDir}/scripts".source = ./scripts;
    "${labwcConfigDir}/environment" = lib.mkForce {
      source = ./environment;
      executable = true;
    };
    "${labwcConfigDir}/autostart" = lib.mkForce {
      source = ./autostart;
      executable = true;
    };
  };
}
