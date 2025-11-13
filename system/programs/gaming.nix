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
    # heroic
    faugus-launcher
    winetricks
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = [
      inputs.dw-proton.packages.${pkgs.stdenv.hostPlatform.system}.dw-proton
    ];
  };
}
