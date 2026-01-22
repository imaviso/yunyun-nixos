# Development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    antigravity
    zed-editor
    dbeaver-bin
  ];
}
