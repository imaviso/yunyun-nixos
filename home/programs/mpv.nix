{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      autoload
      thumbnail
      thumbfast
      mpv-webm
      modernx-zydezu
    ];
    config = {
      vo = "gpu-next";
      gpu-api = "auto";
      hwdec = "auto-safe";

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
  };
}
