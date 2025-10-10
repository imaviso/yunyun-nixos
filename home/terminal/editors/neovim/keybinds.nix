{
  inputs,
  lib,
  ...
}: let
  nix2Lua = inputs.nvf.lib.nvim.lua.toLuaObject;
  inherit (inputs.nvf.lib.nvim.dag) entryBetween entryAfter;
  inherit (lib.generators) mkLuaInline;
  setup = module: table: "require('${module}').setup(${nix2Lua table})";
  mkKeymap = mode: key: action: opts: opts // {inherit mode key action;};
in {
  programs.nvf = {
    enable = true;
    settings = {
      vim.keymaps = [
        (mkKeymap "n" "<leader>e" ":lua MiniFiles.open()<CR>" {})
        (mkKeymap "n" "<leader>ff" ":Pick files<CR>" {})
        (mkKeymap "n" "<leader>fb" ":Pick buffers<CR>" {})
        (mkKeymap "n" "<leader>fg" ":Pick grep_live<CR>" {})
      ];
    };
  };
}
