{
  pkgs,
  inputs,
  ...
}: {
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
    wineWow64Packages.wayland
    mangohud
  ];

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
