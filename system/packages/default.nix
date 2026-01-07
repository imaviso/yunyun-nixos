# System packages module
# Aggregates all package categories
{
  imports = [
    ./core.nix
    ./desktop.nix
    ./development.nix
    ./android.nix
    ./networking.nix
    ./misc.nix
  ];
}
