# Development tools
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dbeaver-bin
  ];
}
