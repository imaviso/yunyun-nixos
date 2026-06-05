{settings, ...}: {
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    font = {
      name = settings.fonts.mono;
      size = 12;
    };
  };
}
