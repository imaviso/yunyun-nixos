{...}: {
  imports = [
    ./configuration.nix
    ./programs
    # ./services
    ./zsh.nix
    ./starship.nix
  ];
}
