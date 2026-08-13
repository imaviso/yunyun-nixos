{pkgs, ...}: {
  services.garage = {
    enable = true;
    package = pkgs.garage_2;
    settings = {
      data_dir = "/mnt/media/garage/data";
      metadata_dir = "/mnt/media/garage/meta";
      db_engine = "sqlite";
      replication_factor = 1;
      rpc_bind_addr = "[::]:3901";
      rpc_public_addr = "127.0.0.1:3901";
      rpc_secret = "da5a72a03f032e241f85f98512338f58b9d452b6c5d781048ea0dc274a9f5566";
      s3_api = {
        s3_region = "garage";
        api_bind_addr = "[::]:3900";
        root_domain = ".s3.garage.localhost";
      };

      s3_web = {
        bind_addr = "[::]:3902";
        root_domain = ".web.garage.localhost";
        index = "index.html";
      };

      admin = {
        api_bind_addr = "[::]:3903";
        # idc local only
        admin_token = "0XviKSF61bV+WbzSgQ8MD0CUh74qYF5gRJKhhwL+MHA=";
        metrics_token = "gUA/BULN7HHWTOGCFhu7Se/ngrCL1BE8gAd19yBcQEk=";
      };
    };
  };
}
