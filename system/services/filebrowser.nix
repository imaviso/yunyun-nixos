{
  services.filebrowser = {
    enable = true;
    user = "yunyun";
    group = "users";
    openFirewall = true;
    settings = {
      address = "192.168.254.191";
      port = 8086;
      root = "/mnt/media/samba";
      database = "/var/lib/filebrowser/filebrowser.db";
      # cache-dir = "/mnt/media2/samba/cache";
    };
  };
}
