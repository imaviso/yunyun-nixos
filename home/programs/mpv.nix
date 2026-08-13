{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      autoload
      thumbfast
      mpv-webm
      modernx-zydezu
    ];
    config = {
      vo = "gpu-next";
      gpu-api = "auto";
      hwdec = "auto-safe";
      target-colorspace-hint = "no";

      profile = "high-quality";
      scale = "ewa_lanczossharp";
      dscale = "mitchell";
      cscale = "spline36";

      deband = "yes";
      deband-iterations = 4;
      dither-depth = "auto";

      keep-open = "yes";
      snap-window = "yes";
      cursor-autohide = 1000;
      save-position-on-quit = true;
      volume = 100;

      osc = "no";
      border = "no";
      osd-bar = "no";
      osd-font-size = 32;

      screenshot-format = "png";
      screenshot-dir = "~/Pictures/mpv";
      screenshot-template = "%F-%p-%n";
      screenshot-high-bit-depth = "no";

      slang = "eng,en";
      alang = "jpn,ja";
    };
    scriptOpts = {
      modernx = {
        compact_mode = "no";
        info_button = "yes";
        title_font_size = 28;
        font_size = 24;
        seek_handle_size = 0;
      };
    };
  };
}
