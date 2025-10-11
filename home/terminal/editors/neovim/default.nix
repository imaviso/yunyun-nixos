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
        clipboard = {
          enable = true;
          registers = "unnamedplus";
        };
        diagnostics = {
          nvim-lint.enable = true;
        };
        visuals = {
          indent-blankline.enable = true;
        };
        notes.todo-comments.enable = true;
        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
          lspconfig.enable = true;
          trouble.enable = true;
        };
        mini = {
          ai.enable = true;
          basics.enable = true;
          bracketed.enable = true;
          bufremove.enable = true;
          clue.enable = true;
          icons.enable = true;
          files.enable = true;
          pick.enable = true;
          notify.enable = true;
          snippets.enable = true;
          surround.enable = true;
          starter.enable = true;
          statusline.enable = true;
          tabline.enable = true;

          completion = {
            enable = true;
          };

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
