# Central library for helper functions
{
  inputs,
  lib,
}: let
  mkHost = import ./mkHost.nix {inherit inputs lib;};
  helpers = import ./helpers.nix {inherit lib;};
in
  mkHost // helpers
