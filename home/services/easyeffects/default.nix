{ config, ... }:
{
  services.easyeffects = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/easyeffects/output".source = ./output;
}
