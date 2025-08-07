{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix-gaming.nixosModules.wine
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  programs.wine.ntsync.enable = true;
  programs.steam.platformOptimizations.enable = true;
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
    };
  };
  environment.systemPackages = with pkgs; [
     inputs.nix-gaming.packages.${pkgs.system}.wine-tkg-ntsync
  ];
}
