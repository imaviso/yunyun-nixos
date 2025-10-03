{ config, lib, ... } : {
  wayland.windowManager.labwc = {
    enable = true;
    systemd = {
      enable = true;
    };
  };

  home.file = {
    "${config.xdg.configHome}/labwc/rc.xml".source = ./rc.xml;
    "${config.xdg.configHome}/labwc/menu.xml".source = ./menu.xml;
    "${config.xdg.configHome}/labwc/scripts".source = ./scripts;
    "${config.xdg.configHome}/labwc/environment" = lib.mkForce {
      source = ./environment;
      executable = true;
    };
    "${config.xdg.configHome}/labwc/autostart" = lib.mkForce {
      source = ./autostart;
      executable = true;
    };
  };
}
