{
  pkgs,
  settings,
  ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    name = settings.appearance.cursor.name;
    package = pkgs.apple-cursor;
    size = settings.appearance.cursor.size;
  };
}
