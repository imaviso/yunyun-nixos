{
  config,
  lib,
  ...
}: let
  labwcConfigDir = "${config.xdg.configHome}/labwc";
in {
  wayland.windowManager.labwc = {
    enable = true;
    systemd.enable = true;
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
