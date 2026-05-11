# Development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor
    zellij
    opencode
    warp-terminal
  ];
}
