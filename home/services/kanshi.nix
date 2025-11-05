{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile = {
          name = "dual";
          outputs = [
            {
              criteria = "DP-3";
              mode = "1920x1080@165.001007Hz";
              position = "0,0";
              # adaptiveSync = true;
            }
            {
              criteria = "HDMI-A-1";
              mode = "1920x1080@143.998993Hz";
              transform = "270";
              position = "1920,-400";
              # adaptiveSync = true;
            }
          ];
        };
      }
    ];
  };
}
