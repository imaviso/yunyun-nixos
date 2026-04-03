{
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
      ui_font_family = "TX-02";
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
