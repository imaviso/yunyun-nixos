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

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    run0-sudo-shim = {
      url = "github:lordgrimmauld/run0-sudo-shim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dw-proton.url = "github:imaviso/dwproton-flake";

    berkeley-mono.url = "path:/home/yunyun/berkeley-flake";

    machinereport.url = "github:imaviso/machinereport";

    google-sans.url = "github:imaviso/google-sans-flake";

    betterfox.url = "github:HeitorAugustoLN/betterfox-nix";

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    hm,
    ...
  }: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    # Import module registries
    nixosModules = import ./modules/nixos {
      inherit lib;
      myLib = import ./lib/helpers.nix {inherit lib;};
    };
    homeModules = import ./modules/home {
      inherit lib;
      myLib = import ./lib/helpers.nix {inherit lib;};
    };

    # Import mkHost helper
    inherit (import ./lib/mkHost.nix {inherit inputs lib;}) mkHost;

    # Import reusable profiles
    profiles = import ./lib/profiles.nix {inherit nixosModules homeModules;};
  in {
    # Export for reuse
    inherit nixosModules homeModules profiles;

    # Pre-commit hooks
    checks.${system} = {
      pre-commit-check = inputs.git-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          alejandra.enable = true;
        };
      };
    };

    # Development shell with formatting tools
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        nixd
        nil
      ];
      shellHook = ''
        ${self.checks.${system}.pre-commit-check.shellHook}
        echo "NixOS config dev shell"
        echo "  alejandra .  - format all nix files"
      '';
    };

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
