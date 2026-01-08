# Hyprland home-manager configuration
{
  pkgs,
  lib,
  monitors ? [],
  settings,
  ...
}: let
  # Convert monitor config to Hyprland format
  mkMonitorString = m: let
    transform =
      if m.transform or 0 != 0
      then ", transform, ${toString m.transform}"
      else "";
  in "${m.name}, ${toString m.width}x${toString m.height}@${toString m.refreshRate}Hz, ${toString m.x}x${toString m.y}, ${toString m.scale}${transform}";

  monitorConfigs =
    if monitors != []
    then map mkMonitorString monitors
    else [
      # Fallback default
      ", preferred, auto, 1"
    ];

  # Get primary monitor name, fallback to first monitor or empty string
  primaryMonitor = let
    primary = lib.findFirst (m: m.primary or false) null monitors;
  in
    if primary != null
    then primary.name
    else if monitors != []
    then (builtins.head monitors).name
    else "";
in {
  imports = [
    ./keybinds.nix
  ];

  # Source caelestia dynamic theme colors and set border colors
  # caelestia-cli writes raw hex colors to ~/.config/hypr/scheme/current.conf
  # Variables are like: $outline = 8c9195 (raw hex, no rgb wrapper)
  # We set the border colors here after sourcing so variables are available
  wayland.windowManager.hyprland.extraConfig = ''
    # Source caelestia theme
    source = ~/.config/hypr/scheme/current.conf

    # Define colors using caelestia variables
    $activeWindowBorderColour = rgba($primarye6)
    $inactiveWindowBorderColour = rgba($onSurfaceVariant11)
    $groupActiveColour = rgba($primaryContainer71)
    $groupInactiveColour = rgba($surfaceContainer18)
    $groupTextColour = rgba($onSurfacee5)
    $shadowColour = rgba($shadow2A)

    # Apply colors
    general:col.active_border = $activeWindowBorderColour
    general:col.inactive_border = $inactiveWindowBorderColour
    group:groupbar:text_color = $groupTextColour
    group:groupbar:col.active = $groupActiveColour
    group:groupbar:col.inactive = $groupInactiveColour
    decoration:shadow:color = $shadowColour
  '';

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    GDK_BACKEND = "wayland";
    CLUTTER_BACKEND = "wayland";
    GTK_THEME = settings.appearance.gtkTheme;
    APP2UNIT_TYPE = "service";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = monitorConfigs;

      input = {
        kb_options = settings.input.keyboardOptions;
        accel_profile = settings.input.accelProfile;
        repeat_delay = settings.input.repeatDelay;
        repeat_rate = settings.input.repeatRate;
      };

      general = {
        gaps_in = settings.layout.gapsInner;
        gaps_out = settings.layout.gapsOuter;
        border_size = settings.layout.borderSize;
        allow_tearing = false;
      };

      group.groupbar = {
        enabled = true;
        scrolling = false;
        gradients = true;
        height = 14;
        font_size = settings.fonts.uiSize;
        font_weight_active = "bold";
        font_weight_inactive = "bold";
        render_titles = true;
        # Colors set via extraConfig using caelestia variables
      };

      dwindle = {
        preserve_split = true;
        smart_split = false;
        smart_resizing = false;
      };

      decoration = {
        rounding = settings.layout.cornerRadius;
        dim_inactive = false;
        blur.enabled = false;
        shadow = {
          enabled = true;
          ignore_window = true;
          range = 20;
          offset = "0 2";
          render_power = 4;
          # Color set via extraConfig using caelestia variables
        };
      };

      animations = {
        enabled = settings.animation.enabled;
        bezier = [
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
        ];
        animation = [
          "windows, 1, 3, md3_decel, slide"
          "windowsIn, 1, 3, md3_decel, slide"
          "windowsOut, 1, 3, md3_accel, slide"
          "border, 1, 10, default"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, popin 60%"
          "layersOut, 1, 1.6, menu_accel, popin 60%"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 0.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
        ];
      };

      misc = {
        vfr = true;
        vrr = 2;
        render_unfocused_fps = 30;
        focus_on_activate = true;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        disable_hyprland_logo = true;
        allow_session_lock_restore = true;
        initial_workspace_tracking = 2;
        font_family = settings.fonts.sans;
      };

      cursor = {
        default_monitor = primaryMonitor;
      };

      render.direct_scanout = 1;

      windowrule = [
        "match:class starrail.exe, idle_inhibit always"
        "match:class client-win64-shipping.exe, idle_inhibit always"
        "match:class client-win64-shipping.exe, render_unfocused on"
        "match:class starrail.exe, render_unfocused on"
        "match:title .*Picture-in-Picture.*, float on"
        "match:title .*Picture-in-Picture.*, pin on"
        "match:title .*Bitwarden Password Manager.*, float on"
        "match:class (brave|chromium)-browser, no_vrr on"
      ];
    };
  };
}
