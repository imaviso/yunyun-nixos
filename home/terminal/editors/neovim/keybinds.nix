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
        (mkKeymap "n" "<leader>f" ":Pick files<CR>" {})
        (mkKeymap "n" "<leader>b" ":Pick buffers<CR>" {})
        (mkKeymap "n" "<leader>/" ":Pick grep_live<CR>" {})
        (mkKeymap "n" "<leader>dd" ":lua MiniBufremove.delete()<CR>" {})
        (mkKeymap "n" "<leader><tab>" ":lua MiniBufremove.unshow_in_window()<CR>" {})
        (mkKeymap "n" "<leader>tt" ":terminal<CR>" {})
        (mkKeymap "n" "<leader>ts" ":split | execute 'resize 15' | terminal<CR>" {})
      ];
    };
  };
}
