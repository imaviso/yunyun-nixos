{
  wayland.windowManager.hyprland.settings = {
    "$kbSession" = "ControlSuper, Delete";
    "$kbClearNotifs" = "ControlSuper, Escape";
    "$kbShowPanels" = "Super, Tab";
    "$kbLock" = "Super, Escape";
    "$kbRestoreLock" = "ControlSuperShift, Escape";

    exec = ["hyprctl dispatch submap global"];

    bind = [
      #actions
      "SuperShift, Q, killactive,"
      "Super, R, togglesplit,"
      "Super, V, togglefloating,"
      "Super, P, pseudo,"
      "Super ALT, ,resizeactive,"

      # utility
      "Super, Return, exec, app2unit -- ghostty"
      "Super, Space, exec, app2unit -- footclient"
      "Super, E, exec, app2unit -- footclient -e yazi"
      "Super, P, exec, hyprpicker -a"
      "SuperShift, E, exec, app2unit -- nautilus"

      # clipboard and emoji picker
      "Super, C, exec, pkill fuzzel || caelestia clipboard"
      "SuperAlt, C, exec, pkill fuzzel || caelestia clipboard -d"
      "Super, Period, exec, pkill fuzzel || caelestia emoji -p"

      # move focus
      "Super, left, movefocus, l"
      "Super, right, movefocus, r"
      "Super, up, movefocus, u"
      "Super, down, movefocus, d"
      "Super, BracketLeft, movefocus, l"
      "Super, BracketRight, movefocus, r"

      #swap windows
      "SuperShift, left, movewindow, l"
      "SuperShift, right, movewindow, r"
      "SuperShift, up, movewindow, u"
      "SuperShift, down, movewindow, d"

      # screenshot
      # area
      ", Print, exec, grimblast --notify copysave area"
      "Super, S, exec, grimblast --notify copysave area"
      # current window
      "SuperShift, S, exec, grimblast --notify --cursor copysave active"
      # current screen
      "SuperAlt, S, exec, grimblast --notify --cursor copysave output"
      # all screens
      "ControlSuper, S, exec, grimblast --notify --cursor copysave screen"

      "ControlSuper, right, workspace, +1"
      "ControlSuper, left, workspace, -1"
      "ControlSuper, BracketLeft, workspace, -1"
      "ControlSuper, BracketRight, workspace, +1"
      "ControlSuper, up, workspace, -5"
      "ControlSuper, down, workspace, +5"
      "Super, Page_Down, workspace, +1"
      "Super, Page_Up, workspace, -1"
      "ControlSuper, Page_Down, workspace, +1"
      "ControlSuper, Page_Up, workspace, -1"
      "Alt, Tab, cyclenext"
      "Alt, Tab, bringactivetotop,"

      # --- Move Window to Workspace ---
      "SuperAlt, Page_Down, movetoworkspace, +1"
      "SuperAlt, Page_Up, movetoworkspace, -1"
      "SuperShift, Page_Down, movetoworkspace, +1"
      "SuperShift, Page_Up, movetoworkspace, -1"
      "ControlSuperShift, Right, movetoworkspace, +1"
      "ControlSuperShift, Left, movetoworkspace, -1"
      "SuperShift, mouse_down, movetoworkspace, -1"
      "SuperShift, mouse_up, movetoworkspace, +1"
      "SuperAlt, mouse_down, movetoworkspace, -1"
      "SuperAlt, mouse_up, movetoworkspace, +1"

      # --- Fullscreen ---
      "SuperShift, F, fullscreen, 0"
      "Super, F, fullscreen, 1"
      "SuperAlt, F, fullscreenstate, 0"

      # --- Direct Workspace Access ---
      "Super, 1, workspace, 1"
      "Super, 2, workspace, 2"
      "Super, 3, workspace, 3"
      "Super, 4, workspace, 4"
      "Super, 5, workspace, 5"
      "Super, 6, workspace, 6"
      "Super, 7, workspace, 7"
      "Super, 8, workspace, 8"
      "Super, 9, workspace, 9"
      "Super, 0, workspace, 10"
      "Super, W, togglespecialworkspace,"

      # --- Move Window to Workspace (Silent) ---
      "SuperShift, 1, movetoworkspacesilent, 1"
      "SuperShift, 2, movetoworkspacesilent, 2"
      "SuperShift, 3, movetoworkspacesilent, 3"
      "SuperShift, 4, movetoworkspacesilent, 4"
      "SuperShift, 5, movetoworkspacesilent, 5"
      "SuperShift, 6, movetoworkspacesilent, 6"
      "SuperShift, 7, movetoworkspacesilent, 7"
      "SuperShift, 8, movetoworkspacesilent, 8"
      "SuperShift, 9, movetoworkspacesilent, 9"
      "SuperShift, 0, movetoworkspacesilent, 10"
      "ControlShiftSuper, Up, movetoworkspacesilent, special"
      "SuperShift, W, movetoworkspacesilent, special"

      # --- Scroll Through Workspaces ---
      "Super, mouse_up, workspace, +1"
      "Super, mouse_down, workspace, -1"
      "ControlSuper, mouse_up, workspace, +1"
      "ControlSuper, mouse_down, workspace, -1"

      # --- Window Resizing ---
      "ControlSuper, Backslash, resizeactive, exact 640 480"

      # --- Window Groups ---
      "Super, G, togglegroup"
      "SuperShift, G, lockactivegroup, toggle"
      "Super, TAB, changegroupactive"
      "Alt, G, moveoutofgroup"

      # cycle workspaces
      "Super, bracketleft, workspace, m-1"
      "Super, bracketright, workspace, m+1"

      # cycle monitors
      "Super SHIFT, bracketleft, focusmonitor, l"
      "Super SHIFT, bracketright, focusmonitor, r"

      # send focused workspace to left/right monitors
      "Super SHIFT ALT, bracketleft, movecurrentworkspacetomonitor, l"
      "Super SHIFT ALT, bracketright, movecurrentworkspacetomonitor, r"

      # shell keybinds (global submap)
      "$kbSession, global, caelestia:session"
      "$kbShowPanels, global, caelestia:showall"
      "$kbLock, global, caelestia:lock"

      # launcher
      "Super, D, global, caelestia:launcher"
    ];

    bindm = [
      "Super, mouse:272, movewindow"
      "Super, mouse:273, resizewindow"
    ];

    bindl = [
      # clear notifications (global submap)
      "$kbClearNotifs, global, caelestia:clearNotifs"

      # restore lock
      "$kbRestoreLock, exec, caelestia shell -d"
      "$kbRestoreLock, global, caelestia:lock"

      # brightness (global submap)
      ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
      ", XF86MonBrightnessDown, global, caelestia:brightnessDown"

      # media controls (global submap)
      "Ctrl+Super, Space, global, caelestia:mediaToggle"
      ", XF86AudioPlay, global, caelestia:mediaToggle"
      ", XF86AudioPause, global, caelestia:mediaToggle"
      "Ctrl+Super, Equal, global, caelestia:mediaNext"
      ", XF86AudioNext, global, caelestia:mediaNext"
      "Ctrl+Super, Minus, global, caelestia:mediaPrev"
      ", XF86AudioPrev, global, caelestia:mediaPrev"
      ", XF86AudioStop, global, caelestia:mediaStop"

      # volume
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      # alternate paste
      ''Ctrl+Shift+Alt, V, exec, sleep 0.5s && ydotool type -d 1 "$(cliphist list | head -1 | cliphist decode)"''
    ];

    bindle = [
      # volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 6%-"
    ];

    submap = "global";
  };
}
