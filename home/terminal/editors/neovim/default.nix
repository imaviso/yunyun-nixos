{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.generators) mkLuaInline;
in {
  imports = [
    inputs.nvf.homeManagerModules.default
    ./theme.nix
    ./languages.nix
    ./keybinds.nix
  ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        options = {
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
        };
        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };
        diagnostics = {
          nvim-lint.enable = true;
        };
        visuals = {
          indent-blankline.enable = true;
          nvim-web-devicons.enable = true;
        };
        notes.todo-comments.enable = true;
        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          lspconfig.enable = true;
          trouble.enable = true;
          lspsaga.enable = false; # Disable lspsaga to avoid conflicts with lspsaga/noice/notify
        };

        # LazyVim Replication
        formatter.conform-nvim.enable = true;
        dashboard.dashboard-nvim.enable = true;
        statusline.lualine.enable = true;
        tabline.nvimBufferline = {
          enable = true;
          setupOpts.options.numbers = "none";
        };
        filetree.neo-tree.enable = true;
        fzf-lua.enable = true;
        binds.whichKey.enable = true;
        autocomplete.blink-cmp.enable = true;
        autocomplete.blink-cmp.friendly-snippets.enable = true;
        notify.nvim-notify.enable = true;
        ui.noice.enable = true;
        git.gitsigns.enable = true;
        treesitter.context.enable = true;
        utility.motion.flash-nvim.enable = true;
        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
        session.nvim-session-manager.enable = true;

        mini = {
          ai.enable = true;
          basics.enable = true;
          bracketed.enable = true;
          bufremove.enable = true;
          icons.enable = true;
          surround.enable = true;

          pairs = {
            enable = true;
            setupOpts = {
              modes = {
                insert = true;
                command = true;
                terminal = false;
              };
              skip_next = ''[%w%%%'%[%"%.%`%$]'';
              skip_ts = ["string"];
              skip_unbalanced = true;
              markdown = true;
            };
          };
        };

        ui.colorizer = {
          enable = true;
          setupOpts.filetypes = {
            "*" = {
              RRGGBB = true;
              names = false;
              RRGGBBAA = true;
              AARRGGBB = true;
              rgb_fn = true;
              hsl_fn = true;
              css = true;
              css_fn = true;
              tailwind = true;
              sass = true;
            };
          };
        };
      };
    };
  };
}
