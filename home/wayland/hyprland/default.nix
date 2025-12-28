{
  imports = [
    ./keybinds.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "DP-3, 1920x1080@165.00Hz, 0x0, 1"
        "HDMI-A-1, 1920x1080@144.00Hz, 1920x-400, 1, transform, 3"
      ];
      input = {
        accel_profile = "flat";
        repeat_delay = 250;
        repeat_rate = 35;
      };
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        allow_tearing = false;
        "col.active_border" = "rgba(73737373)";
        "col.inactive_border" = "rgba(0a0a0a0a)";
      };
      group = {
        groupbar = {
          enabled = true;
          scrolling = false;
          gradients = true;
          height = 14;
          font_size = 10;
          font_weight_active = "bold";
          font_weight_inactive = "bold";
          render_titles = true;
          text_color = "rgba(e5e5e5e5)";
          "col.active" = "rgba(71717a71)";
          "col.inactive" = "rgba(18181b18)";
        };
      };
      dwindle = {
        preserve_split = true;
        smart_split = false;
        smart_resizing = false;
      };
      decoration = {
        rounding = 10;
        dim_inactive = false;
        blur = {
          enabled = false;
        };
        shadow = {
          enabled = true;
          ignore_window = true;
          range = 20;
          offset = "0 2";
          render_power = 4;
          color = "rgba(0000002A)";
        };
      };
      animations = {
        enabled = true;
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
        font_family = "Geist";
      };
      render = {
        direct_scanout = 1;
      };
      windowrulev2 = [
        "float, title:^(.*Bitwarden Password Manager.*)$"
        "renderunfocused, class:^(client-win64-shipping.exe)$"
        "renderunfocused, class:^(starrail.exe)$"
      ];
      layerrule = [
        "noanim, quickshell"
        "noanim, quickshell.*"
      ];
    };
  };
}
