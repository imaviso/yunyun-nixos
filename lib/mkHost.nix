# Helper function to create NixOS host configurations
{
  inputs,
  lib,
}: {
  # Create a NixOS system configuration
  # Args:
  #   hostname: string - the hostname/config name
  #   system: string - the system architecture (default: x86_64-linux)
  #   username: string - the primary user (default: yunyun)
  #   homeDirectory: string - the user's home directory (default: /home/${username})
  #   nixosModules: list - additional NixOS modules to include
  #   homeModules: list - additional home-manager modules to include
  #   extraSpecialArgs: attrset - extra args passed to modules
  mkHost = {
    hostname,
    system ? "x86_64-linux",
    username ? "yunyun",
    homeDirectory ? "/home/${username}",
    nixosModules ? [],
    homeModules ? [],
    extraSpecialArgs ? {},
  }:
    let
      # Load host-specific variables if they exist
      hostVarsPath = ../hosts/${hostname}/vars.nix;
      hostVars = if builtins.pathExists hostVarsPath
        then import hostVarsPath
        else { monitors = []; settings = {}; };
      
      # Merge all special args
      allSpecialArgs = {
        inherit inputs hostname username hostVars;
        monitors = hostVars.monitors or [];
      } // extraSpecialArgs;
    in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = allSpecialArgs;
      modules =
        [
          # Host-specific configuration
          ../hosts/${hostname}

          inputs.hm.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bk";
              extraSpecialArgs = allSpecialArgs;
              users.${username} = {
                imports = homeModules;
                home = {
                  inherit username homeDirectory;
                  stateVersion = "24.05";
                };
              };
            };
          }
        ]
        ++ nixosModules;
    };
}
