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
        (mkKeymap "n" "<leader>e" ":Neotree toggle<CR>" {desc = "Explorer";})
        (mkKeymap "n" "<leader>f" ":FzfLua files<CR>" {desc = "Find Files";})
        (mkKeymap "n" "<leader>b" ":FzfLua buffers<CR>" {desc = "Buffers";})
        (mkKeymap "n" "<leader>/" ":FzfLua live_grep<CR>" {desc = "Grep";})

        (mkKeymap "n" "<leader>dd" ":lua MiniBufremove.delete()<CR>" {desc = "Close Buffer";})

        (mkKeymap "n" "<leader>cf" ":lua require('conform').format({ lsp_fallback = true })<CR>" {desc = "Format";})

        (mkKeymap "n" "gd" ":FzfLua lsp_definitions<CR>" {desc = "Goto Definition";})
        (mkKeymap "n" "gr" ":FzfLua lsp_references<CR>" {desc = "Goto References";})
        (mkKeymap "n" "gI" ":FzfLua lsp_implementations<CR>" {desc = "Goto Implementation";})
        (mkKeymap "n" "gy" ":FzfLua lsp_typedefs<CR>" {desc = "Goto Type Definition";})
        (mkKeymap "n" "<leader>cr" ":lua vim.lsp.buf.rename()<CR>" {desc = "Rename";})
        (mkKeymap "n" "<leader>ca" ":FzfLua lsp_code_actions<CR>" {desc = "Code Action";})
        (mkKeymap "n" "K" ":lua vim.lsp.buf.hover()<CR>" {desc = "Hover";})
        (mkKeymap "n" "[d" ":lua vim.diagnostic.goto_prev()<CR>" {desc = "Prev Diagnostic";})
        (mkKeymap "n" "]d" ":lua vim.diagnostic.goto_next()<CR>" {desc = "Next Diagnostic";})
        (mkKeymap "n" "<leader>gg" ":LazyGit<CR>" {desc = "LazyGit";})
        (mkKeymap "n" "<leader>tf" ":ToggleTerm direction=float<CR>" {desc = "Toggle Terminal Float";})
        (mkKeymap "n" "<leader>th" ":ToggleTerm size=10 direction=horizontal<CR>" {desc = "Toggle Terminal Horizontal";})
        (mkKeymap "n" "<leader>tv" ":ToggleTerm size=80 direction=vertical<CR>" {desc = "Toggle Terminal Vertical";})
        (mkKeymap "t" "<leader>tf" "<C-\\><C-n>:ToggleTerm<CR>" {desc = "Toggle Terminal Float";})
        (mkKeymap "t" "<leader>th" "<C-\\><C-n>:ToggleTerm<CR>" {desc = "Toggle Terminal Horizontal";})
        (mkKeymap "t" "<leader>tv" "<C-\\><C-n>:ToggleTerm<CR>" {desc = "Toggle Terminal Vertical";})

        (mkKeymap "n" "<S-h>" ":bprevious<CR>" {})
        (mkKeymap "n" "<S-l>" ":bnext<CR>" {})
        (mkKeymap "n" "[b" ":bprevious<CR>" {})
        (mkKeymap "n" "]b" ":bnext<CR>" {})

        (mkKeymap "n" "<C-Up>" ":resize +2<cr>" {})
        (mkKeymap "n" "<C-Down>" ":resize -2<cr>" {})
        (mkKeymap "n" "<C-Left>" ":vertical resize -2<cr>" {})
        (mkKeymap "n" "<C-Right>" ":vertical resize +2<cr>" {})

        (mkKeymap "n" "<leader>tt" ":terminal<CR>" {})
        (mkKeymap "n" "<leader>ts" ":split | execute 'resize 15' | terminal<CR>" {})

        (mkKeymap "n" "<leader><tab>l" ":tablast<CR>" {})
        (mkKeymap "n" "<leader><tab>o" ":tabonly<CR>" {})
        (mkKeymap "n" "<leader><tab>f" ":tabfirst<CR>" {})
        (mkKeymap "n" "<leader><tab><tab>" ":tabnew<CR>" {})
        (mkKeymap "n" "<leader><tab>d" ":tabclose<CR>" {})
        (mkKeymap "n" "<leader><tab>]" ":tabnext<CR>" {})
        (mkKeymap "n" "<leader><tab>[" ":tabprevious<CR>" {})
      ];
    };
  };
}
