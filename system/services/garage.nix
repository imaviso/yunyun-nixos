{pkgs, ...}: {
  services.garage = {
    enable = true;
    package = pkgs.garage_2;
    settings = {
      data_dir = "/mnt/media/garage/data";
      metadata_dir = "/mnt/media/garage/meta";
    };
  };
}
