{
  services.filebrowser = {
    enable = true;
    user = "yunyun";
    group = "users";
    openFirewall = true;
    settings = {
      address = "192.168.254.191";
      port = 8085;
      root = "/mnt/media2/samba/vianney";
      database = "/mnt/media2/samba/filebrowser.db";
      # cache-dir = "/mnt/media2/samba/cache";
    };
  };
}
