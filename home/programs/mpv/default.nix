{ config, ... } : {
  programs.mpv = {
    enable = true;
  };

  home.file."${config.xdg.configHome}/mpv/mpv.conf".source = ./mpv.conf;
  home.file."${config.xdg.configHome}/mpv/scripts".source = ./scripts;
  home.file."${config.xdg.configHome}/mpv/script-opts".source = ./script-opts;
  home.file."${config.xdg.configHome}/mpv/fonts".source = ./fonts;
  home.file."${config.xdg.configHome}/mpv/shaders".source = ./shaders;
  home.file."${config.xdg.configHome}/mpv/input.conf".source = ./input.conf;

}
