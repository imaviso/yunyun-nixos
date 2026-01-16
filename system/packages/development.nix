# Development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    antigravity
    windsurf
    dbeaver-bin
  ];
}
