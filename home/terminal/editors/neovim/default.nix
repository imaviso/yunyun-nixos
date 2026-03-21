{
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs.nvf.lib.nvim.dag) entryAnywhere;
  fffNvim = inputs.fff-nvim.packages.${pkgs.stdenv.hostPlatform.system}.fff-nvim;
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
        startPlugins = [fffNvim];
        pluginRC.fff-nvim = entryAnywhere ''
          local fff = require("fff")

          local function git_root()
            return vim.fs.root(0, { ".git" })
          end

          fff.setup({})

          vim.api.nvim_create_user_command("FFFFind", function(opts)
            if opts.args and opts.args ~= "" then
              if vim.fn.isdirectory(opts.args) == 1 then
                fff.find_files_in_dir(opts.args)
              else
                fff.search_and_show(opts.args)
              end
              return
            end

            local root = git_root()
            if root then
              fff.find_files_in_dir(root)
            else
              fff.find_files()
            end
          end, {
            nargs = "?",
            force = true,
            complete = function(arg_lead)
              local dirs = vim.fn.glob(arg_lead .. "*", false, true)
              local results = {}
              for _, dir in ipairs(dirs) do
                if vim.fn.isdirectory(dir) == 1 then
                  table.insert(results, dir)
                end
              end
              return results
            end,
            desc = "Find files with FFF (defaults to git root)",
          })

          vim.api.nvim_create_user_command("FFFGrep", function(opts)
            local grep_opts = {
              cwd = git_root() or vim.uv.cwd(),
            }

            if opts.args and opts.args ~= "" then
              grep_opts.query = opts.args
            end

            fff.live_grep(grep_opts)
          end, {
            nargs = "?",
            force = true,
            desc = "Live grep with FFF (defaults to git root)",
          })
        '';
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
