# Development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor
    dbeaver-bin
    zellij
    opencode
  ];
}
