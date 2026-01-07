# Networking tools
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wgcf
    wireguard-tools
  ];
}
