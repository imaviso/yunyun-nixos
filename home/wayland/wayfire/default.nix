{pkgs, ...}: {
  wayland.windowManager.wayfire = {
    enable = true;
    systemd.enable = true;
    plugins = with pkgs.wayfirePlugins; [
      wcm
      wayfire-plugins-extra
      wayfire-shadows
      wwp-switcher
      windecor
    ];
    settings = {
      core = {
        plugins = "animate command expo follow-focus focus-change grid foreign-toplevel ipc ipc-rules input-method-v1 move oswitch place resize session-lock scale switcher shortcuts-inhibit session-lock vswitch window-rules wm-actions winshadows xdg-activation";
        close_top_view = "<super> <shift> KEY_Q";
        vwidth = 3;
        vheight = 3;
        preferred_decoration_mode = "server";
      };
      input = {
        xkb_layout = "us";
        mouse_accel_profile = "flat";
        kb_repeat_delay = 250;
        kb_repeat_rate = 35;
      };
      "output:DP-3" = {
        mode = "1920x1080@165.001";
        position = "0,0";
      };
      "output:HDMI-A-1" = {
        mode = "1920x1080@143.999";
        position = "1920,-400";
        transform = 270;
      };
      autostart = {
        autostart_wf_shell = false;
        outputs = false;
        notification = false;
        gamma = false;
        idle = false;
        portal = false;
        background = false;
      };
      move.activate = "<super> BTN_LEFT";
      resize.activate = "<super> BTN_RIGHT";
      zoom.modifier = "<super> KEY_Z";
      command = {
        binding_terminal = "<super> KEY_ENTER";
        command_terminal = "footclient";
        binding_launcher = "<super> KEY_D";
        command_launcher = "dms ipc call spotlight toggle";
        binding_file_manager_term = "<super> KEY_E";
        command_file_manager_term = "footclient -e 'yazi' yazi";
        binding_file_manager = "<super> <shift> KEY_E";
        command_file_manager = "nautilus";
        binding_screenshot = "<super> KEY_S";
        command_screenshot = "grim -g \"$(slurp)\" - | swappy -f -";
        binding_clipboard_manager = "<super> KEY_C";
        command_clipboard_manager = "dms ipc call clipboard toggle";
        binding_color_picker = "<super> KEY_P";
        command_color_picker = "hyprpicker -a";
        binding_ocr = "<super> KEY_T";
        command_ocr = "grim -g \"$(slurp)\" \"tmp.png\" && tesseract -l eng \"tmp.png\" - | wl-copy && rm \"tmp.png\"";
        binding_powermenu = "<super> <shift> KEY_L";
        command_powermenu = "dms ipc call powermenu toggle";
        binding_settings = "<super> <shift> KEY_COMMA";
        command_settings = "dms ipc call settings toggle";
        binding_processlist = "<super> <shift> KEY_M";
        command_processlist = "dms ipc call processlist toggle";
        binding_controlcenter = "<super> <shift> KEY_ESC";
        command_controlcenter = "dms ipc call control-center toggle";
        repeatable_binding_volume_up = "KEY_VOLUMEUP";
        command_volume_up = "dms ipc call audio increment 3";
        repeatable_binding_volume_down = "KEY_VOLUMEDOWN";
        command_volume_down = "dms ipc call audio decrement 3";
        binding_mute = "KEY_MUTE";
        command_mute = "dms ipc call audio mute";
      };
      follow-focus = {
        change_view = true;
        change_output = true;
        focus_delay = 0;
        threshold = 0;
        raise_on_top = false;
      };
      focus-change = {
        up = "<super> KEY_K";
        down = "<super> KEY_J";
        left = "<super> KEY_H";
        right = "<super> KEY_L";
      };
      wm-actions = {
        toggle_fullscreen = "<super> <shift> KEY_F";
        toggle_maximize = "<super> KEY_F";
        toggle_send_to_back = "<super> KEY_A";
        toggle_showdesktop = "<super> <shift> KEY_A";
      };
      window-rules = {
        maximize_foot = "on created if app_id is \"foot\" then maximize";
        maximize_footclient = "on created if app_id is \"footclient\" then maximize";
        maximize_yazi = "on created if app_id is \"yazi\" then maximize";
      };
      animate = {
        duration = 200;
        close_animation = "fade";
        open_animation = "fade";
      };
      # decoration = {
      #   font = "SFPro Text Nerd Font 12";
      #   active_color = "0.10 0.10 0.10 1.0";
      #   inactive_color = "0.23 0.23 0.23 1.0";
      #   border_size = 3;
      #   title_height = 18;
      # };
      scale = {
        toggle = "<super> KEY_W";
        duration = 200;
      };
      vswitch = {
        duration = 200;
        binding_1 = "<super> KEY_1";
        binding_2 = "<super> KEY_2";
        binding_3 = "<super> KEY_3";
        binding_4 = "<super> KEY_4";
        binding_5 = "<super> KEY_5";
        binding_6 = "<super> KEY_6";
        binding_7 = "<super> KEY_7";
        binding_8 = "<super> KEY_8";
        binding_9 = "<super> KEY_9";
        send_win_1 = "<super> <shift> KEY_1";
        send_win_2 = "<super> <shift> KEY_2";
        send_win_3 = "<super> <shift> KEY_3";
        send_win_4 = "<super> <shift> KEY_4";
        send_win_5 = "<super> <shift> KEY_5";
        send_win_6 = "<super> <shift> KEY_6";
        send_win_7 = "<super> <shift> KEY_7";
        send_win_8 = "<super> <shift> KEY_8";
        send_win_9 = "<super> <shift> KEY_9";
      };
      switcher = {
        next_view = "<alt> KEY_TAB";
        prev_view = "<alt> <shift> KEY_TAB";
        speed = 200;
      };
      expo = {
        toggle = "<super> <shift> KEY_W";
      };
      oswitch = {
        next_output = "<super> KEY_TAB";
        next_output_with_win = "<super> <shift> KEY_TAB";
      };
    };
  };
}
