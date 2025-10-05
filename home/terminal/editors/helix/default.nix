{ pkgs, ... }:
{
  imports = [
    ./languages.nix
    ./keybinds.nix
    ./theme.nix
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      markdown-oxide
      nodePackages.vscode-langservers-extracted
      shellcheck
    ];

    settings = {
      theme = "minimal";
      editor = {
        color-modes = true;
        completion-trigger-len = 1;
        completion-replace = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
            select = "underline";
        };
        indent-guides.render = true;
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
        lsp.display-inlay-hints = true;
        soft-wrap.enable = true;
        statusline.center = [ "position-percentage" ];
        true-color = true;
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
        whitespace.characters = {
          newline = "↴";
          tab = "⇥";
        };
      };
    };
  };
}
