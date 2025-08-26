{ pkgs, inputs, ... }: {

  imports = [
    inputs.nix-gaming.nixosModules.wine
    inputs.nix-gaming.nixosModules.platformOptimizations
  ];

  programs.wine.ntsync.enable = true;
  programs.steam.platformOptimizations.enable = true;
  # programs.gamemode = {
  #   enable = true;
  #   settings = {
  #     general = {
  #       softrealtime = "auto";
  #       renice = 15;
  #     };
  #   };
  # };
  environment.systemPackages = with pkgs; [
     inputs.nix-gaming.packages.${pkgs.system}.wine-tkg-ntsync
  ];

  programs.honkers-railway-launcher.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = [
      inputs.cachy-proton.packages.${pkgs.system}.proton-cachyos
    ];
  };
}
