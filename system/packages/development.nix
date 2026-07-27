# Development tools
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor
    pi-coding-agent
    code-cursor
    zellij
    jujutsu
    lazygit
  ];
}
