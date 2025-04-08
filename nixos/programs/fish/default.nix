{ pkgs, ...}: {

# environment.systemPackages = with pkgs; [
#   fishPlugins.done
#   fishPlugins.fzf-fish
#   fishPlugins.forgit
#   fishPlugins.hydro
#   fishPlugins.grc
#   grc
# ];

programs.fish = {
  enable = true;
};
programs.starship.enable = true;
}
