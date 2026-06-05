{settings, ...}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "astro"
      "java"
      "docker-compose"
      "opencode"
      "typst"
    ];
    userSettings = {
      vim_mode = true;
      telemetry.metrics = false;
      ui_font_family = settings.fonts.mono;
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
