{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix-gaming.nixosModules.ntsync
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  programs.wine.ntsync.enable = true;
  programs.steam.platformOptimizations.enable = true;
  
  environment.systemPackages = with pkgs; [
     inputs.nix-gaming.packages.${pkgs.system}.wine-tkg-ntsync
  ];
}
