{
  services.immich = {
    enable = true;
    openFirewall = true;
    host = "";
    mediaLocation = "/mnt/media2/immich";
    environment = {
      IMMICH_IGNORE_MOUNT_CHECK_ERRORS = "true";
    };
  };
}
