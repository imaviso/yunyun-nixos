{
  description = "Yunyun's simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = inputs @ {
    nixpkgs,
    aagl,
    ...
  }: {
    nixosConfigurations = {
      yunyun = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/user.nix
            {
            imports = [ aagl.nixosModules.default ];
            }
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
  };
}
