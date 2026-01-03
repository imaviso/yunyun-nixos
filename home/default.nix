# Home-manager base module
# This file is imported when using homeModules that include all home modules
# Individual modules are imported via flake.nix homeModules
{
  imports = [
    ./fontconfig.nix
    ./cursor.nix
    ./theme
    ./xdg.nix
    ./git.nix
    ./terminal
    ./programs
    ./wayland
    ./services
  ];

  # stateVersion, username, and homeDirectory are set by mkHost
}
