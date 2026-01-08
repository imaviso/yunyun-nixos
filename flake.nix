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

    ghostty = {
      url = "github:ghostty-org/ghostty";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dw-proton.url = "github:imaviso/dwproton-flake";

    berkeley-mono.url = "path:/home/yunyun/berkeley-flake";

    slothsonic.url = "github:imaviso/slothsonic";

    google-sans.url = "github:imaviso/google-sans-flake";

    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";
  };

  outputs = inputs @ { self, nixpkgs, hm, ... }:
  let
    lib = nixpkgs.lib;

    # Import module registries
    nixosModules = import ./modules/nixos;
    homeModules = import ./modules/home;

    # Import mkHost helper
    inherit (import ./lib/mkHost.nix { inherit inputs lib; }) mkHost;

    # Import reusable profiles
    profiles = import ./lib/profiles.nix { inherit nixosModules homeModules; };

  in {
    # Export for reuse
    inherit nixosModules homeModules profiles;

    nixosConfigurations = {
      # Main desktop
      yunyun = mkHost {
        hostname = "desktop";
        username = "yunyun";
        nixosModules = profiles.desktop.nixos;
        homeModules = profiles.desktop.home;
      };

      yunyun-laptop = mkHost {
        hostname = "laptop";
        username = "yunyun";
        nixosModules = profiles.laptop.nixos;
        homeModules = profiles.laptop.home;
      };

      # Home server (uncomment when needed)
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
