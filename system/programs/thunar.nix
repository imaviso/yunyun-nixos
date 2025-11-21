{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.file-roller
  ];
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
    ]; # Enable some plugins for archive support
  };
  services = {
    tumbler.enable = true; # Thunar thumbnailer
    gvfs.enable = true; # Enable gvfs for stuff like trash, mtp
    gvfs.package = pkgs.gvfs; # Set to gvfs instead of gnome gvfs
  };
}
