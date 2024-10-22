{
  virtualisation.oci-containers.containers = {
    multi-scrobbler = {
      image = "foxxmd/multi-scrobbler";
      autoStart = true; # Start the container automatically
      ports = [ "9078:9078" ]; # Port mappings
      environment = {
        TZ = "Asia/Manila"; # Specify timezone from TZ Database name found here https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
      };
      volumes = [ "/opt/multi-scrobbler:/config" ]; # Volume mappings
    };
  };
}
