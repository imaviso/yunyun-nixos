{...}: {
  imports = [
    ./configuration.nix
    ./services
    ./programs
    ./networking.nix
    ./i18n.nix
    ./zsh.nix
    ./fonts.nix
    ./starship.nix
  ];
}
