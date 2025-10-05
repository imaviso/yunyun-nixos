{
  programs.helix = {
    themes = {
      minimal = let
        transparent = "none";
        gray = "#737373";
        light-gray = "#a3a3a3";
        dark-gray = "#404040";
        white = "#e5e5e5";
        black = "#0a0a0a";
        red = "#ef4444";
        green = "#22c55e";
        yellow = "#eab308";
        orange = "#f97316";
        blue = "#3b82f6";
        magenta = "#d946ef";
        cyan = "#06b6d4";
      in {
        "ui.menu" = transparent;
        "ui.menu.selected" = { modifiers = [ "reversed" ]; };
        "ui.linenr" = { fg = light-gray; bg = black; };
        "ui.popup" = { modifiers = [ "reversed" ]; };
        "ui.linenr.selected" = { fg = white; bg = black; modifiers = [ "bold" ]; };
        "ui.selection" = { fg = black; bg = blue; };
        "ui.selection.primary" = { modifiers = [ "reversed" ]; };
        "comment" = { fg = gray; };
        "ui.statusline" = { fg = light-gray; bg = black; };
        "ui.statusline.inactive" = { fg = dark-gray; bg = gray; };
        "ui.virtual.indent-guide" = dark-gray;
        "ui.help" = { fg = dark-gray; bg = gray; };
        "ui.cursor" = { modifiers = [ "reversed" ]; };
        "variable" = white;
        "variable.builtin" = orange;
        "constant.numeric" = orange;
        "constant" = orange;
        "attributes" = yellow;
        "type" = yellow;
        "ui.cursor.match" = { fg = yellow; modifiers = [ "underlined" ]; };
        "string" = blue;
        "variable.other.member" = white;
        "constant.character.escape" = cyan;
        "function" = blue;
        "constructor" = blue;
        "special" = blue;
        "keyword" = magenta;
        "label" = magenta;
        "namespace" = blue;
        "diff.plus" = green;
        "diff.delta" = yellow;
        "diff.minus" = red;
        "diagnostic" = { modifiers = [ "underlined" ]; };
        "ui.gutter" = { bg = black; };
        "info" = blue;
        "hint" = dark-gray;
        "debug" = dark-gray;
        "warning" = yellow;
        "error" = red;
      };
    };
  };
}
