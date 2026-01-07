# Misc packages
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    komikku      # Manga reader
    vial         # Keyboard firmware manager
    pear-desktop # Desktop app
  ];
}
