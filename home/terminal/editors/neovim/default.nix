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
        diagnostics = {
          nvim-lint.enable = true;
        };
        visuals = {
          indent-blankline.enable = true;
        };
        ui = {
          noice = {
            enable = true;
          };
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
          basics = {
            enable = true;
          };
          bracketed = {
            enable = true;
          };
          bufremove = {
            enable = true;
          };
          clue = {
            enable = true;
          };
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

          icons = {
            enable = true;
          };

          snippets = {
            enable = true;
          };

          starter = {
            enable = true;
          };

          statusline = {
            enable = true;
          };

          tabline = {
            enable = true;
          };

          files = {
            enable = true;
          };
          pick = {
            enable = true;
          };
        };
      };
    };
  };
}
