# Development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor
    pi-coding-agent
    zellij
    jujutsu
    lazygit
  ];
}
