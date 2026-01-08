# Host-specific variables for laptop
# Only hardware-specific data that modules need to read
{
  # Monitor configuration for Hyprland/Wayland
  monitors = [
    {
      name = "eDP-1";
      width = 1366;
      height = 768;
      refreshRate = 60;
      x = 0;
      y = 0;
      scale = 1;
      transform = 0;
      primary = true;
    }
  ];

  gpu = "intel"; # or "nvidia", "amd"

  # Networking configuration
  networking = {
    nameservers = [
      "192.168.254.2"
      "192.168.254.1"
    ];
    timeServers = [
      "time.cloudflare.com"
      "0.ph.pool.ntp.org"
    ];
  };
}
