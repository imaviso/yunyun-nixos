{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell/v0.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-fonts.url= "github:Lyndeno/apple-fonts.nix";
  };

  outputs = inputs @ {
    nixpkgs,
    lanzaboote,
    quickshell,
    apple-fonts,
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
