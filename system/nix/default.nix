{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./nh.nix
    ./substituters.nix
    ./nixpkgs.nix
    ./direnv.nix
  ];

  environment.systemPackages = [pkgs.git];
  nixpkgs.overlays = [
    (final: prev: {
      inherit
        (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];

  nix = let
    flakeInputs = lib.filterAttrs (_: v: lib.isType "flake" v) inputs;
  in {
    package = pkgs.lixPackageSets.latest.lix;

    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) flakeInputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      trusted-users = [
        "root"
        "@wheel"
      ];

      accept-flake-config = false;
    };
  };
}
