{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-gaming.url = "github:fufexan/nix-gaming";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs @ {
    nixpkgs,
    lanzaboote,
    zen-browser,
    nix-gaming,
    ...
  }: {
    nixosConfigurations = {
      yunyun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/desktop.nix
          {
            imports = [
              lanzaboote.nixosModules.lanzaboote
            ];
          }
        ];
      };
    };
  };
}
