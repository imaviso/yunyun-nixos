{
  programs.fish = {
    enable = true;
    interactiveShellInit = "microfetch";
    shellAliases = {
      ls = "eza";
      l = "eza -l";
      tree = "eza -T";
      copy = "rsync -avh --no-compress --progress --info=progress2";
    };
  };
}
