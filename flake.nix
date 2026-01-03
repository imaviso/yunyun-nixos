{
  description = "Yunyun's modular NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        rust-overlay.follows = "rust-overlay";
      };
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # quickshell = {
    #   url = "github:quickshell-mirror/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # dms = {
    #   url = "github:AvengeMedia/DankMaterialShell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dw-proton.url = "github:imaviso/dwproton-flake";

    # vicinae.url = "github:vicinaehq/vicinae";

    berkeley-mono.url = "path:/home/yunyun/berkeley-flake";

    slothsonic.url = "github:imaviso/slothsonic";

    google-sans.url = "github:imaviso/google-sans-flake";

    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    hm,
    ...
  }: let
    lib = nixpkgs.lib;

    nixosModules = import ./modules/nixos;
    homeModules = import ./modules/home;

    inherit (import ./lib/mkHost.nix {inherit inputs lib;}) mkHost;

    profiles = {
      desktop = {
        nixos = with nixosModules; [
          config
          nix
          services.all
          programs.terminal
          programs.gaming
          programs.chromium
          programs.localsend
          programs.thunar
          programs.nix-ld
          wayland.hyprland
        ];
        home = with homeModules; [
          fontconfig
          cursor
          theme
          xdg
          git
          terminal.all
          programs.mpv
          programs.betterfox
          wayland.hyprland
          services.caelestia
          services.easyeffects
          services.clipboard
          services.footserver
          services.polkit-agent
        ];
      };

      server = {
        nixos = with nixosModules; [
          config
          nix
          services.ssh
          services.docker
        ];
        home = with homeModules; [
          terminal.all
          git
        ];
      };
    };
  in {
    inherit nixosModules homeModules profiles;

    nixosConfigurations = {
      yunyun = mkHost {
        hostname = "desktop";
        username = "yunyun";
        nixosModules = profiles.desktop.nixos;
        homeModules = profiles.desktop.home;
      };

      # laptop = mkHost {
      #   hostname = "laptop";
      #   username = "yunyun";
      #   nixosModules = with nixosModules; [
      #     config
      #     nix
      #     services.all
      #     programs.all
      #     wayland.hyprland
      #   ];
      #   homeModules = with homeModules; [
      #     fontconfig
      #     cursor
      #     theme
      #     xdg
      #     git
      #     terminal.all
      #     programs.all
      #     wayland.hyprland
      #     services.all
      #   ];
      # };

      # homeserver = mkHost {
      #   hostname = "homeserver";
      #   username = "admin";
      #   nixosModules = profiles.server.nixos ++ [
      #     nixosModules.services.tailscale
      #   ];
      #   homeModules = profiles.server.home;
      # };
    };
  };
}
