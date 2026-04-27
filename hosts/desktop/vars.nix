# Host-specific variables for desktop
# Only hardware-specific data that modules need to read
{
  # Monitor configuration for Hyprland/Wayland
  monitors = [
    {
      name = "DP-3";
      width = 1920;
      height = 1080;
      refreshRate = 165;
      x = 0;
      y = 0;
      scale = 1;
      transform = 0;
      primary = true;
    }
    # {
    #   name = "HDMI-A-1";
    #   width = 1920;
    #   height = 1080;
    #   refreshRate = 144;
    #   x = 1920;
    #   y = -400;
    #   scale = 1;
    #   transform = 3; # 270 degrees rotation
    #   primary = false;
    # }
  ];

  # Hardware info (used by multiple modules)
  gpu = "amd";

  # Networking configuration
  networking = {
    nameservers = [
      "192.168.254.2"
      "192.168.254.117"
    ];
    timeServers = [
      "time.cloudflare.com"
      "0.ph.pool.ntp.org"
    ];
  };
}
