{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-gaming.url = "github:fufexan/nix-gaming";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "github:quickshell-mirror/quickshell/v0.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs"; 
    };

    cachy-proton.url = "github:jackgrahn/cachy-proton-nix";
  };

  outputs = inputs @ {
    nixpkgs,
    #lanzaboote,
    nix-gaming,
    quickshell,
    aagl,
    cachy-proton,
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
              #lanzaboote.nixosModules.lanzaboote
              aagl.nixosModules.default
            ];
          }
        ];
      };
    };
  };
}
