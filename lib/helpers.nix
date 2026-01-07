# Helper functions for module discovery and configuration
{ lib }:
{
  # Automatically import all .nix files in a directory (excluding default.nix)
  # Usage: importDir ./services
  importDir = dir:
    let
      files = builtins.readDir dir;
      nixFiles = lib.filterAttrs (name: type:
        (type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix")
        || (type == "directory" && builtins.pathExists (dir + "/${name}/default.nix"))
      ) files;
    in
    map (name:
      if lib.hasSuffix ".nix" name
      then dir + "/${name}"
      else dir + "/${name}"
    ) (builtins.attrNames nixFiles);

  # Create a module attrset from a directory for the registry
  # Returns: { moduleName = path; ... }
  mkModuleAttrs = dir:
    let
      files = builtins.readDir dir;
      processEntry = name: type:
        let
          baseName = lib.removeSuffix ".nix" name;
          path = dir + "/${name}";
        in
        if type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix" then
          { ${baseName} = path; }
        else if type == "directory" && builtins.pathExists (path + "/default.nix") then
          { ${name} = path; }
        else
          {};
    in
    lib.foldl' (acc: name: acc // processEntry name files.${name}) {} (builtins.attrNames files);

  # Merge multiple module attrsets
  mergeModules = modules: lib.foldl' (acc: m: acc // m) {} modules;
}
