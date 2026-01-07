# Host-specific variables for laptop
# Only hardware-specific data that modules need to read
{
  # Monitor configuration for Hyprland/Wayland
  monitors = [
    {
      name = "eDP-1";
      width = 1920;
      height = 1080;
      refreshRate = 60;
      x = 0;
      y = 0;
      scale = 1;
      transform = 0;
      primary = true;
    }
  ];

  # Hardware info
  gpu = "intel"; # or "nvidia", "amd"
}
