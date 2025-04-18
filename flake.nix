{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";

    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    stylix.url = "github:danth/stylix";

  };

  outputs = inputs @ {
    nixpkgs,
    aagl,
    nix-gaming,
    hyprpanel,
    stylix,
    ...
  }: {
    nixosConfigurations = {
      yunyun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/user.nix
          {
            imports = [
              aagl.nixosModules.default
              stylix.nixosModules.stylix
            ];
          }
        ];
      };
    };
  };
}
