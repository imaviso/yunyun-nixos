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

  home.stateVersion = "24.05";
  home.username = "yunyun";
  home.homeDirectory = "/home/yunyun";

}
