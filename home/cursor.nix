{
  pkgs,
  settings,
  ...
}: {
  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    name = settings.appearance.cursor.name;
    package = pkgs.apple-cursor;
    size = settings.appearance.cursor.size;
  };
}
