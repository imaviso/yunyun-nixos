{settings, ...}: {
  fonts.fontconfig = {
    enable = true;
    antialiasing = true;
    hinting = "slight";
    subpixelRendering = "rgb";

    defaultFonts = {
      serif = [settings.fonts.serif];
      sansSerif = [settings.fonts.sans];
      monospace = [settings.fonts.mono];
      emoji = [settings.fonts.emoji];
    };
  };
}
