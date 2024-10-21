{
  virtualisation.oci-containers.containers = {
    open-webui = {
      image = "ghcr.io/open-webui/open-webui:main";
      autoStart = true; # Start the container automatically
      ports = [ "8081:8080" ]; # Port mappings
      environment = {
        WEBUI_SECRET_KEY = "ianmathew123A!";
      };
      volumes = [ "/opt/open-webui:/app/backend/data" ]; # Volume mappings
    };
  };
}
