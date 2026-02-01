# Helper functions for module discovery and configuration
{lib}: {
  # Simple recursive module scanner
  # Maps file structure to attribute structure:
  # dir/foo.nix -> { dir = { foo = ./dir/foo.nix; }; }
  # dir/bar/default.nix -> { dir = { bar = { default = ./dir/bar/default.nix; }; }; }
  mkModuleAttrs = dir: let
    collect = path: let
      files = builtins.readDir path;
      process = name: type: let
        p = path + "/${name}";
      in
        if type == "directory"
        then {${name} = collect p;}
        else if lib.hasSuffix ".nix" name
        then {${lib.removeSuffix ".nix" name} = p;}
        else {};
    in
      lib.foldl' (acc: name: acc // (process name files.${name})) {} (builtins.attrNames files);
  in
    collect dir;
}
