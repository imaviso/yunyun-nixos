{config, ...}: {
  home.file."${config.xdg.configHome}/niri/config.kdl".source = ./config.kdl;
}
